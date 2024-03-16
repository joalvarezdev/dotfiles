#!/bin/bash

git clone https://aur.archlinux.org/ghq.git ~/.config/ghq

cd ~/.config/ghq

makepkg -si
