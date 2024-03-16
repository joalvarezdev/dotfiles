#!/bin/bash

git clone https://github.com/alacritty/alacritty ~/.config/alacritty

cd ~/.config/alacritty

curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup override set stable
rustup update stable

sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

cargo build --release

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-dektop-database
