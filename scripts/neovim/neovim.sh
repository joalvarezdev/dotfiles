#!/usr/bin/bash

cd ~

if ! pacman -Q fuse &>/dev/null; then
	sudo pacman -S fuse
fi

if [ ! -f "/opt/nvim/nvim/nvim.appimage" ]; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

	chmod u+x nvim.appimage

	sudo mkdir -p /opt/nvim
	sudo mv nvim.appimage /opt/nvim/nvim

	export PATH="$PATH:/opt/nvim/"
fi
