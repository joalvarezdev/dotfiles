#!/bin/bash

if [ ! -d "$HOME/.ssh" ]; then
  mkdir -p $HOME/.ssh
fi

if [ -f "$HOME/.ssh/config" ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/ssh/config" "$HOME/.ssh/config"

"$DOTFILES/ssh/create_pub_key.sh"
