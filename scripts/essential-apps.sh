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
  k9s \
  docker \
  docker-compose \
  make \
  gcc \
  fzf \
  ripgrep \
  lua \
  luarocks \
  ruby \
  sshpass \
  python-cookiecutter \
  xclip \
  pre-commit \
  shellcheck \
  ansible \
  feh \
  noto-fonts \
  noto-fonts-emoji \
  noto-fonts-cjk \
  python-pre-commit
