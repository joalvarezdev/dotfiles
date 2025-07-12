#!/bin/bash

SSH_DIR="$HOME/.ssh"

if [ ! -d "$SSH_DIR" ]; then
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"
fi

KEY_FILE_NAME="$SSH_DIR/joalvarezdev"

if [ -f "$KEY_FILE_NAME" ]; then
  exit 0
fi

EMAIL="alvarez.joaquinez@gmail.com"
ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_FILE_NAME" -N ""

chmod 600 "$KEY_FILE_NAME"
chmod 644 "$KEY_FILE_NAME.pub"
