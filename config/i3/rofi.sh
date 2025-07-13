#!/bin/bash

set -e

ROFI_THEMES="/usr/share/rofi/themes"
ROFI_TMP="/tmp/rofi"
ROFI_CONFIG="$HOME/.config/rofi"

if [ -f "$ROFI_THEMES/rounded-red-dark.rasi" ]; then
  exit 0
fi

git clone https://github.com/lr-tech/rofi-themes-collection.git /tmp/rofi

sudo cp -r "$ROFI_TMP/themes" /usr/share/rofi/themes

sudo rm -rf $ROFI_TMP

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALATION_CONF="$(dirname "$SCRIPT_DIR")"

if [ -d $ROFI_CONFIG ]; then
  rm -rf $ROFI_CONFIG
fi

ln -sf "$INSTALATION_CONF/i3/config.rasi" $ROFI_CONFIG
