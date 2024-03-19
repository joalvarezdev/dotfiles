#!/usr/bin/bash

dotfiles="$HOME/dotfiles"

# I3 SIMBOLIC LINK
if [ ! -L "$HOME/.i3" ]; then
	ln -s "$dotfiles/apps/.i3" "$HOME/.i3"
fi

# ALACRITTY CONFIGURATION
if [ ! -L "$HOME/.alacritty.toml" ]; then
	ln -s "$dotfiles/apps/alacritty/.alacritty.toml" "$HOME/.alacritty.toml"
fi

# VIM INTELLIJ
if [ ! -L "$HOME/.ideavimrc" ]; then
	ln -s "$dotfiles/apps/intelliJ/.ideavimrc" "$HOME/.ideavimrc"
fi

# TMUX CONFIGURATION
if [ ! -L "$HOME/.tmux.conf" ]; then
	ln -s "$dotfiles/apps/tmux/.tmux.conf" "$HOME/.tmux.conf"
fi

# INTELLIJ KEYMAPS
if [ ! -L "$HOME/.config/JetBrains/IntelliJIdea2023.3/keymaps" ]; then
	ln -s "$dotfiles/apps/intelliJ/keymaps" "$HOME/.config/JetBrains/IntelliJIdea2023.3/keymaps"
fi

# VSCODE KEYMAPS
if [ ! -L "$HOME/.config/Code - OSS/User/keybindings.json" ]; then
	ln -s "$dotfiles/apps/vscode/keybindings.json" "$HOME/.config/Code - OSS/User/keybindings.json"
fi

# VSCODE CONFIGURATION
if [ ! -L "$HOME/.config/Code - OSS/User/settings.json" ]; then
	ln -s "$dotfiles/apps/vscode/settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi

# ZSH CONFIGURATION
if [ ! -L "$HOME/.zshrc" ]; then
	ln -s "$dotfiles/zsh_config/.zshrc" "$HOME/.zshrc"
fi

# SSH CONFIGURATION
if [ ! -L "$HOME/.ssh/config" ]; then
	ln -s "$dotfiles/apps/ssh/config" "$HOME/.ssh/config"
fi
