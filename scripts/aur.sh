#!/bin/bash

set -e

if command -v yay &> /dev/null; then
	exit 0
fi

sudo pacman -S --needed --noconfirm base-devel git

git clone https://aur.archlinux.org/yay.git /tmp/yay

cd /tmp/yay
makepkg -si --noconfirm

cd /
rm -rf /tmp/yay
