#!/bin/bash

set -e

ROFI_THEMES="/usr/share/rofi/themes"
ROFI_TMP="/tmp/rofi"
ROFI_CONFIG="$HOME/.config/rofi"

if [ -f "$ROFI_THEMES/rounded-red-dark.rasi" ]; then
  exit 0
fi

if [ -d "$ROFI_TMP" ]; then
  echo "Limpiando directorio temporal existente..."
  rm -rf "$ROFI_TMP"
fi

git clone https://github.com/lr-tech/rofi-themes-collection.git /tmp/rofi

sudo cp -r "$ROFI_TMP/themes"/* "$ROFI_THEMES/"

sudo rm -rf $ROFI_TMP

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALATION_CONF="$(dirname "$SCRIPT_DIR")"

if [ -d $ROFI_CONFIG ]; then
  rm -rf $ROFI_CONFIG
fi

mkdir -p $ROFI_CONFIG

ln -sf "$INSTALATION_CONF/i3/config.rasi" $ROFI_CONFIG
