#!/bin/bash

if ! pacman -Q ttf-fira-code &>/dev/null; then
	sudo pacman -S ttf-fira-code
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

dot_zsh="~/dotfiles/zsh_config/.zshrc"
path_final="~/.zshrc"

if [ ! -L "$path_final" ]; then
	ln -s "$dot_zsh" "$path_final"
fi

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k"]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
