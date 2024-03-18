#!/usr/bin/bash

fonts_path="/usr/share/fonts/MapleMono-Bold.ttf"

if [ ! -f "$fonts_path" ]; then
	sudo cp $DOTFILES/assets/fonts/**.ttf /usr/share/fonts/
fi

fc-cache -f -v
