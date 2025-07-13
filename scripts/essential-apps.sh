#!/bin/bash

set -e

sudo pacman -S --needed --noconfirm \
  git \
  curl \
  ghq \
  neovim \
  zsh \
  rustup \
  rofi \
  nvm \
  unzip \
  jq \
  tmux \
  kubectl \
  k9s
