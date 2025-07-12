#!/bin/bash

if [ -d "$HOME/.config/i3" ]; then
  exit 0
fi

mkdir -p "$HOME/.config/i3"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/i3/config" "$HOME/.config/i3/config"
