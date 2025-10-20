#!/bin/bash

if [ -f ~/.gitconfig ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/git/.gitconfig" "$HOME/"

ln -sf "$DOTFILES/git/.gitconfig-github" "$HOME/"

ln -sf "$DOTFILES/git/.gitconfig-gitlab-infosis" "$HOME/"

gh auth login
