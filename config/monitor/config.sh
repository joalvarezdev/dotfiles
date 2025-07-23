#!/bin/bash

if xrandr | grep "HDMI-1 connected" >/dev/null; then
  xrandr --output eDP-1 --primary --mode 1400x900 --pos 0x180 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos 1400x0 --rotate normal \
    --output DP-1 --mode 1920x1080 --pos 3320x0 --rotate normal \
    --output DP-2 --off
fi

feh --bg-scale $HOME/dotfiles/assets/img/wallpaper-1.jpg
