#!/bin/bash

if ! [ -d ~/.config/alacritty ]; then
	git clone https://github.com/alacritty/alacritty ~/.config/alacritty
fi

cd ~/.config/alacritty

if ! command -v rustup &>/dev/null; then
	curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup override set stable
rustup update stable

sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

cargo build --release

infocmp alacritty

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

## CREATE LN
original="~/dotfiles/apps/alacritty/.alacritty.toml"
enlace="~/.alacritty.toml"

if [ ! -L "$enlace" ]; then
	ln -s ~/dotfiles/apps/alacritty/.alacritty.toml ~/.alacritty.toml
fi
