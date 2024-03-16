#!/bin/bash

if ! command -v ghq &>/dev/null; then
	git clone https://aur.archlinux.org/ghq.git ~/.config/ghq

	cd ~/.config/ghq

	makepkg -si
fi
