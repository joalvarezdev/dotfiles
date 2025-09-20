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

load_vpn_pass() {
  TMP_FILE="/tmp/$1"

  if [ -f "$TMP_FILE" ]; then

    cat "$TMP_FILE" 2>/dev/null
  else
    [ -z "$1" ] && exit 1
    get_session
    notes=$(bw get item "$1" | jq -r '.notes // empty')
    [ -z "$notes" ] && exit 1

    echo $notes

    echo "$notes" >"$TMP_FILE" && cat "$TMP_FILE" 2>/dev/null
  fi
}
