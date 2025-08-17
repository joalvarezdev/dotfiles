#!/bin/bash

set -e

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$INSTALL_DIR/scripts/essential-apps.sh"
"$INSTALL_DIR/scripts/aur.sh"
"$INSTALL_DIR/scripts/aur-apps.sh"
"$INSTALL_DIR/scripts/shell.sh"
"$INSTALL_DIR/scripts/fonts.sh"
"$INSTALL_DIR/scripts/goji.sh"
"$INSTALL_DIR/scripts/sdkman.sh"

## CONFIGURATION

"$INSTALL_DIR/config/zsh/config.sh"

"$INSTALL_DIR/config/nvim/config.sh"
"$INSTALL_DIR/config/alacritty/config.sh"

"$INSTALL_DIR/config/i3/config.sh"

"$INSTALL_DIR/config/git/config.sh"
"$INSTALL_DIR/config/ssh/config.sh"
"$INSTALL_DIR/config/tmux/config.sh"
"$INSTALL_DIR/config/nvm/config.sh"
"$INSTALL_DIR/config/docker/config.sh"
"$INSTALL_DIR/config/breeze/config.sh"

"$INSTALL_DIR/config/intelij/config.sh"
"$INSTALL_DIR/config/vscode/config.sh"
