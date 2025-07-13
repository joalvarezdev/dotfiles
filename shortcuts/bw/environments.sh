#!/bin/bash

SESSION_FILE="$HOME/.bw-session"

check_session() {
  [ -f "$SESSION_FILE" ] &&
    BW_SESSION="$(cat $SESSION_FILE)" bw status | grep -q "unlocked"
}

get_session() {
  if ! check_session; then
    BW_SESSION=$(bw unlock --raw) || exit 1
    echo "$BW_SESSION" >"$SESSION_FILE"
    chmod 600 "$SESSION_FILE"
  else
    BW_SESSION=$(cat "$SESSION_FILE")
  fi

  export BW_SESSION
}

load_env() {
  [ -z "$1" ] && exit 1

  get_session

  notes=$(bw get item "$1" | jq -r '.notes // empty')
  [ -z "$notes" ] && exit 1

  TMP_FILE="/tmp/$1"

  echo $notes >"$TMP_FILE" && source "$TMP_FILE"

  rm "$TMP_FILE"
}

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
