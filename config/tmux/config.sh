#!/bin/bash

set -e

if ! command -v tmux &>/dev/null; then
  exit 0
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
