#!/bin/bash

if [ ! -d "$HOME/.ssh" ]; then
  mkdir -p $HOME/.ssh
fi

if [ -f "$HOME/.ssh/config" ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALLATION_DIR="$(dirname "$SCRIPT_DIR")"

ln -sf "$INSTALLATION_DIR/ssh/config" "$HOME/.ssh/config"

"$INSTALLATION_DIR/ssh/create_pub_key.sh"
