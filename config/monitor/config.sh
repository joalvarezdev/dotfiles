#!/bin/bash

if xrandr | grep "HDMI-1 connected" >/dev/null; then
  xrandr --output eDP-1 --primary --brightness 0.75 --mode 1680x1050 --pos 3840x0 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-2 --off
fi

feh --bg-scale $HOME/dotfiles/assets/img/wallpaper-1.jpg
