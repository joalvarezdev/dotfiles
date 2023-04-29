#!/bin/bash

if pgrep Spotify > /dev/null
then
	echo "foco"
	wmctrl -xa Spotify
else
	spotify
fi
