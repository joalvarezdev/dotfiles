#!/bin/bash

set -e

sudo pacman -S --needed --noconfirm \
  ttf-fira-code \
  ttf-firacode-nerd \
  noto-fonts-emoji \
  ttf-ubuntu-mono-nerd

mkdir -p ~/.local/share/fonts

curl -L "https://github.com/romkattv/powerlevel10k-media/raw/master/MesloLGS%20%NF%20%Regular.ttf" -o ~/.local/share/fonts/"MesloLGS NF Regular.ttf"

curl -L "https://github.com/romkattv/powerlevel10k-media/raw/master/MesloLGS%20%NF%20%Bold.ttf" -o ~/.local/share/fonts/"MesloLGS NF Bold.ttf"

curl -L "https://github.com/romkattv/powerlevel10k-media/raw/master/MesloLGS%20%NF%20%Italic.ttf" -o ~/.local/share/fonts/"MesloLGS NF Italic.ttf"

curl -L "https://github.com/romkattv/powerlevel10k-media/raw/master/MesloLGS%20%NF%20%Bold%20%.ttf" -o ~/.local/share/fonts/"MesloLGS NF Bold.ttf"

# update cache
fc-cache -fv &>/dev/null
