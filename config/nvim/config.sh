#!/bin/bash

set -e

REPOSITORY_NAME="lazy-vim"
HOST="github.com/joalvarezdev/$REPOSITORY_NAME"
GHQ_PATH="$(ghq root)/$HOST"

if [ ! -d "$GHQ_PATH" ]; then
  ghq get https://$HOST.git
fi

NVIM_CONFIG="$HOME/.config/nvim"

if [ ! -d "$NVIM_CONFIG" ]; then
  ln -sf "$GHQ_PATH" "$HOME/.config/nvim"
fi
