# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

BREW_PREFIX="$(brew --prefix)"

fpath=("$BREW_PREFIX/share/zsh/site-functions" $fpath)

autoload -Uz compinit
compinit -C -d ~/.config/zsh/.zcompdump

# Powerlevel10k
source "$BREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# p10k config
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# need for expand complete on alias
setopt complete_aliases

# eza aliases
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

alias cat="bat --paging=never --style=plain"
alias find="fd"
alias grep="rg"

alias tdev="$HOME/.config/tmux/layout-dev.sh"

# search dir + cd in
cdf() {
  local dir

  dir=$(
    fd --type d --hidden --exclude .git |
      fzf \
        --height 90% \
        --layout reverse \
        --border \
        --preview 'eza --tree --level=2 --icons {}'
  ) || return

  cd "$dir"
}

# search process + kill
fkill() {
  local pid

  pid=$(
    ps aux |
      fzf \
        --height 80% \
        --layout reverse \
        --border |
      awk '{print $2}'
  ) || return

  [[ -n "$pid" ]] && kill -9 "$pid"
}

# quick file search + preview + open
ff() {
  local file

  file=$(
    fd --type f --hidden --exclude .git |
      fzf \
        --height 90% \
        --layout reverse \
        --border \
        --preview 'bat --style=numbers --color=always --line-range :200 {}'
  ) || return

  nvim "$file"
}

zle -N ff-widget ff

bindkey '^F' ff-widget

# global text search + preview + open
fg() {
  local selected
  local file
  local line

  selected=$(
    rg --line-number --column --smart-case "$1" |
      fzf \
        --delimiter : \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
  ) || return

  file=$(echo "$selected" | cut -d: -f1)
  line=$(echo "$selected" | cut -d: -f2)

  nvim "+$line" "$file"
}

# last git commit diff
glc() {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1 || {
    echo "Not inside a git repository"
    return 1
  }

  local commit
  local file

  commit="$(git rev-parse HEAD)"

  file=$(
    git show --name-only --pretty=format: "$commit" |
      sed '/^$/d' |
      fzf \
        --height 90% \
        --layout reverse \
        --border \
        --header "Last commit: $(git log -1 --pretty=format:'%h %s')" \
        --preview "git show --color=always --stat --patch -- {}"
  ) || return

  nvim "$file"
}

gls() {
  local file

  file=$(
    (
      git diff --name-only
      git diff --cached --name-only
      git ls-files --others --exclude-standard
    ) | sort -u |
      fzf \
        --height=90% \
        --layout=reverse \
        --border \
        --header="Working tree changes" \
        --preview '
          if git ls-files --error-unmatch {} >/dev/null 2>&1; then
            git diff --color=always -- {}
            git diff --cached --color=always -- {}
          else
            bat --color=always --style=numbers {}
          fi
        '
  ) || return

  nvim "$file"
}

# enable zellij with random theme
zj() {
  local layouts=(everforest kanagawa kanagawa-bg sakura sakura-bg)
  local selected=${layouts[$((RANDOM % ${#layouts[@]} + 1))]}

  zellij --layout "$selected"
}

# WSL tools: clipboard nvim
if grep -qi microsoft /proc/version; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ "$OSTYPE" == linux* ]]; then
  bindkey "^[[H" beginning-of-line
  bindkey "^[[F" end-of-line
  bindkey "^[OH" beginning-of-line
  bindkey "^[OF" end-of-line
  bindkey "^[[3~" delete-char
fi

# zsh plugins
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
