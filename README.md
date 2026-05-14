# Initial Setup Instructions

## Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade
```

## Nerd font
```bash
brew tap homebrew/cask-fonts
brew install --cask font-inconsolata-nerd-font
```

### Mac
```bash
mkdir -p ~/Library/Fonts

curl -L -o /tmp/Inconsolata.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Inconsolata.zip

unzip -o /tmp/Inconsolata.zip -d ~/Library/Fonts
```

### Linux
```bash
 mkdir -p ~/.local/share/fonts
 curl -L \
   -o /tmp/Inconsolata.zip \
   https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Inconsolata.zip
 
 unzip -o /tmp/Inconsolata.zip -d ~/.local/share/fonts
 
 fc-cache -fv
```
### Remember to set terminal font to: Inconsolata Nerd Font

## Shell
```bash
brew install zsh

brew install romkatv/powerlevel10k/powerlevel10k

brew install \
  zsh-autosuggestions \
  zsh-completions \
  zsh-syntax-highlighting

brew install \
  eza \
  bat \
  fzf \
  fd \
  ripgrep \
  zoxide \
  btop \
  atuin

$(brew --prefix)/opt/fzf/install
atuin import auto

#### IMPORTANTE:
#### zsh-syntax-highlighting debe cargarse el último en .zshrc

mkdir -p ~/.config/zsh ~/.config/zellij ~/.config/atuin

cp -r mydotfiles/.config/zsh ~/.config/

echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv

#### enable zsh by default
chsh -s "$(which zsh)"
```

## Zellij
```bash
brew install zellij

cp -r mydotfiles/.config/zellij ~/.config/
```

### Solo en caso de tener problemas con los plugins
```bash
# descarga de nuevo si crees que están corruptos
mkdir -p ~/zellij/plugins
curl -L -o ~/zellij/plugins/zellij_forgot.wasm https://github.com/karimould/zellij-forgot/releases/latest/download/zellij_forgot.wasm 
curl -L -o ~/.config/zellij/plugins/zjstatus.wasm https://github.com/dj95/zjstatus/releases/download/v0.23.0/zjstatus.wasm 
curl -L -o ~/.config/zellij/plugins/zjframes.wasm https://github.com/dj95/zjstatus/releases/download/v0.23.0/zjframes.wasm

# borra cache y pide permisos otra vez explicitos
rm -rf ~/.cache/zellij
zellij
zellij plugin -- file:/home/david/.config/zellij/plugins/zjstatus.wasm
```

## Nvim

### LazyVim
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
##### first run
nvim
# wait for plugins to install, then quit and reopen nvim

#### for formatter kdl
brew install rust
cargo install kdlfmt
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc
brew install prettier
```
### Only WSL: clipboard hack
```bash
mkdir -p ~/.local/bin
curl -Lo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip
unzip /tmp/win32yank.zip -d /tmp/win32yank
mv /tmp/win32yank/win32yank.exe ~/.local/bin/
chmod +x ~/.local/bin/win32yank.exe
```

### Copy nvim config
```bash
cp -r mydotfiles/.config/nvim ~/.config/
```
#### review this file for clipboard configuration 
> ~/.config/nvim/lua/config/options.lua
#### review this file for disable random theme 
> ~/.config/nvim/init.lua

## Opcionales
```bash
brew toilet # banner generator
brew asciicinema # record terminal
brew pandoc # conversor docs
brew chafa # terminal image viewer
```
