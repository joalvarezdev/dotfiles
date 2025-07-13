#!/bin/bash

set -e

if [ "$SHELL" == "/usr/bin/zsh" ]; then
  exit 0
fi

sudo pacman -S --needed --noconfirm zsh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/"

chsh -s /usr/bin/zsh

sudo reboot now

exec zsh

