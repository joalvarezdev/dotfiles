#!/bin/bash

set -e

if [ -f "/usr/share/rofi/themes/rounded-red-dark.rasi" ]; then
  exit 0
fi

git clone https://github.com/lr-tech/rofi-themes-collection.git /tmp/rofi

sudo cp -r * /tmp/rofi /usr/share/rofi/themes

sudo rm -rf /tmp/rofi
