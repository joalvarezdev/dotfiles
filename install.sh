#!/bin/bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$DOTFILES/scripts/essential-apps.sh"
"$DOTFILES/scripts/aur.sh"
"$DOTFILES/scripts/aur-apps.sh"
"$DOTFILES/scripts/shell.sh"
"$DOTFILES/scripts/fonts.sh"
"$DOTFILES/scripts/goji.sh"

## CONFIGURATION

"$DOTFILES/config/i3/config.sh"

"$DOTFILES/config/git/config.sh"
"$DOTFILES/config/ssh/config.sh"
"$DOTFILES/config/nvm/config.sh"
"$DOTFILES/config/nvim/config.sh"

"$DOTFILES/config/alacritty/config.sh"
"$DOTFILES/config/zsh/config.sh"
