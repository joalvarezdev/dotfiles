#!/bin/bash

if [[ $(pgrep -cx alacritty) -gt 0 ]]; then
	wmctrl -x -a alacritty.Alacritty
else
	alacritty
fi
