#!/bin/bash

set -e

# if ! command -v tmux &>/dev/null; then
# exit 0
# fi

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES="$(dirname "$SCRIPT_DIR")"

ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/"

tmux

"$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"
