#!/bin/bash

source $DOTFILES/shortcuts/bw/functions.sh

download() {
  [ -z "$1" ] && exit 1

  get_session

  notes=$(bw get item "$1" | jq -r '.notes // empty')
  [ -z "$notes" ] && exit 1

  TMP_FILE="/tmp/$1"

  echo "$notes" >"$TMP_FILE"
}

case "$1" in
"load") load_env "$2" ;;
"list")
  get_session
  bw list items | jq -r '.[] | select(.name) | .name'
  ;;
"download")
  download "$2"
  ;;
"clear") rm -f "$SESSION_FILE" ;;
esac
