#!/bin/bash

if pgrep -x "obsidian" > /dev/null
then
	wmctrl -a "obsidian"
else
	~/dev/applications/obsidian/Obsidian-1.1.16.AppImage
fi
