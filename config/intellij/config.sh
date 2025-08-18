#!/bin/bash

mkdir -p "$HOME/.config/JetBrains/IdeaIC2025.2/keymaps"

if [ ! -L "$HOME/.config/JetBrains/IdeaIC2025.2/keymaps/d3.xml" ]; then
  ln -sf "$HOME/dotfiles/config/intellij/d3.xml" "$HOME/.config/JetBrains/IdeaIC2025.2/keymaps/"
fi

if [ ! -L "$HOME/.ideavimrc" ]; then
  ln -sf "$HOME/dotfiles/config/intellij/.ideavimrc" "$HOME"
fi
