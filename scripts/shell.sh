#!/bin/bash

set -e

if [ "$SHELL" == "/usr/bin/zsh" ]; then
  exit 0
fi

sudo pacman -S --needed --noconfirm zsh

chsh -s /usr/bin/zsh

exec zsh
