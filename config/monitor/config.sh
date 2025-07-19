#!/bin/bash

if xrandr | grep "HDMI-1 connected" >/dev/null; then
  xrandr --output eDP-1 --primary --mode 1400x900 --pos 0x15 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos 1680x0 --rotate normal \
    --output DP-1 --off --output DP-2 --mode 1920x1080 --pos 3600x0 --rotate normal
fi
