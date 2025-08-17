#!/bin/bash

if xrandr | grep "HDMI-1 connected" >/dev/null; then
  xrandr --output eDP-1 --primary --mode 1680x1050 --pos 0x15 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos 1680x15 --rotate normal \
    --output DP-1 --mode 1920x1080 --pos 3600x0 --rotate normal \
    --output DP-2 --off
fi

feh --bg-scale $HOME/dotfiles/assets/img/wallpaper-1.jpg
