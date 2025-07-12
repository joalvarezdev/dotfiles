#!/bin/bash

set -e

sudo pacman -S --needed --noconfirm alacritty

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/alacritty/.alacritty.toml" "$HOME/.alacritty.toml"
