#!/bin/bash

set -eu

WALLPAPER="$HOME/dotfiles/assets/img/wallpaper-1.jpg"
PROFILE_HOME_OFFICE="$HOME/dotfiles/config/monitor/profiles/home-office.sh"

is_connected() {
  xrandr | grep -q "^$1 connected"
}

has_external_monitor() {
  xrandr | grep -qE "^(HDMI|DP)-[0-9]+ connected"
}

count_monitors() {
  xrandr | grep " connected" | wc -l
}

enable_if_connected() {
  output="$1"
  shift

  if is_connected "$output"; then
    xrandr --output "$output" "$@"
  else
    xrandr --output "$output" --off
  fi
}

setup_dock() {
  xrandr --output eDP-1 --off

  enable_if_connected DP-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal
  enable_if_connected HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal
  enable_if_connected DP-1 --mode 1680x1050 --pos 3840x0 --rotate normal
}

setup_laptop() {
  xrandr \
    --output eDP-1 --primary --brightness 0.75 --auto --pos 0x0 --rotate normal \
    --output HDMI-1 --off \
    --output DP-1 --off \
    --output DP-2 --off
}

main() {
  MONITOR_COUNT=$(count_monitors)

  if [ "$MONITOR_COUNT" -ge 2 ] && [ -f "$PROFILE_HOME_OFFICE" ]; then
    "$PROFILE_HOME_OFFICE"
  else
    setup_laptop_only
  fi

  feh --bg-scale "$WALLPAPER"
}

main "$@"

# if xrandr | grep "HDMI-1 connected" >/dev/null; then
#   xrandr --output eDP-1 --primary --brightness 0.75 --mode 1680x1050 --pos 3840x0 --rotate normal \
#     --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
#     --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal \
#     --output DP-1 --off
# fi
#
# feh --bg-scale $HOME/dotfiles/assets/img/wallpaper-1.jpg
