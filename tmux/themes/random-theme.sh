#!/usr/bin/env bash

THEMES=(
  "$HOME/.config/tmux/themes/everforest.conf"
  "$HOME/.config/tmux/themes/everforest-box.conf"
  "$HOME/.config/tmux/themes/kanagawa.conf"
  "$HOME/.config/tmux/themes/kanagawa-box.conf"
  "$HOME/.config/tmux/themes/sakura.conf"
  "$HOME/.config/tmux/themes/sakura-box.conf"
  "$HOME/.config/tmux/themes/tokyonight.conf"
  "$HOME/.config/tmux/themes/tokyonight-box.conf"
)

THEME="${THEMES[$RANDOM % ${#THEMES[@]}]}"

tmux source-file "$THEME"
tmux display-message "Theme: $(basename "$THEME" .conf)"
