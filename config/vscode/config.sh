#!/bin/bash

mkdir -p "$HOME/.config/Code/User"

if [ ! -L "$HOME/.config/Code/User/settings.json" ]; then
  ln -sf "$HOME/dotfiles/config/vscode/settings.json" "$HOME/.config/Code/User"
fi

if [ ! -L "$HOME/.config/Code/User/keybindings.json" ]; then
  ln -sf "$HOME/dotfiles/config/vscode/keybindings.json" "$HOME/.config/Code/User"
fi
