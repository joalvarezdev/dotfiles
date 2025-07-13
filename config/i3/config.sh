#!/bin/bash

if [ -d "$HOME/.config/i3" ]; then
  rm -rf "$HOME/.config/i3"
fi

mkdir -p "$HOME/.config/i3"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALATION_CONF="$(dirname "$SCRIPT_DIR")"

ln -sf "$INSTALATION_CONF/i3/config" "$HOME/.config/i3/config"

source "$INSTALATION_CONF/i3/rofi.sh"
