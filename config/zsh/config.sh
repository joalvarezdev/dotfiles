#!/bin/bash

set -e

if ! command -v yay &>/dev/null; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  "$SCRIPT_DIR/aur.sh"
fi

yay -S --needed --noconfirm oh-my-zsh-git

cp -r /usr/share/oh-my-zsh/ $HOME/.oh-my-zsh

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone https://github.com/romkatv/powerlevel10k "$ZSH_CUSTOM/themes/powerlevel10k"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALLATION_DIR="$(dirname "$SCRIPT_DIR")"

ln -sf "$INSTALLATION_DIR/zsh/.p10k.zsh" "$HOME/"

ln -sf "$INSTALLATION_DIR/zsh/.zshrc" "$HOME/"
