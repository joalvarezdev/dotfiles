#!/bin/bash

if ! pacman -Q ttf-fira-code &>/dev/null; then
	sudo pacman -S ttf-fira-code
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -L "~/.zshrc" ]; then
	ln -s "~/dotfiles/zsh_config/.zshrc" "~/.zshrc"
fi
