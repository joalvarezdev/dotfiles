#!/bin/bash

alias display::ls="xrandr --query | awk '/ connected/{print $1}'"
display::off() {

  if [ -z "$1" ]; then # -z cadena vacia
    xrandr --query | awk '/ connected/{print $1}'
    return 1
  fi

  xrandr --output "$1" --off
}
display::on() {

  if [ -z "$1" ]; then # -z cadena vacia
    xrandr --query | awk '/ connected/{print $1}'
    return 1
  fi

  xrandr --output "$1" --auto
}
display::on::pos() {
    local out="$1"
    local pos="$2"
    local ref="$3"

    if [ -z "$out" ] || [ -z "$pos" ] || [ -z "$ref" ]; then
      echo "Uso: display::on::pos <OUTPUT> <left|right|above|below> <REF_OUTPUT>"
      return 1
    fi

    case "$pos" in
      left)  xrandr --output "$out" --auto --left-of "$ref" ;;
      right) xrandr --output "$out" --auto --right-of "$ref" ;;
      above) xrandr --output "$out" --auto --above "$ref" ;;
      below) xrandr --output "$out" --auto --below "$ref" ;;
      *) echo "Posicion invalida: $pos"; return 2 ;;
    esac

}

alias display::i3::ls="i3-msg -t get_workspaces | jq ."
display::move() {
  local ws="$1"
  local output="$2"

  if [[ -z "$ws" || -z "$output" ]]; then
    echo "use: i3::move <workspace> <output>"
    return 2
  fi

  # if ! i3-msg -t get_workspaces | jq -e --arg ws "$ws" \
  #   '.[] | select((.name == $ws) or (.num|tostring == $ws))' >/dev/null; then
  #   echo "workspace do not exists: $ws"
  #   return 1
  # fi

  if ! i3-msg -t get_outputs | jq -e --arg out "$output" \
    '.[] | select(.name == $out and .active == true)' >/dev/null; then
    echo "output do not exists: $output"
    return 1
  fi

  i3-msg "workspace \"$ws\"; move workspace to output $output" >/dev/null

}

