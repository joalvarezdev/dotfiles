#!/bin/bash

if [ -f ~/.gitconfig ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/git/.gitconfig" "$HOME/"

gh auth login
