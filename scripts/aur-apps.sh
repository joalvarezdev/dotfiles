#!/bin/bash

set -e

if ! command -v yay &>/dev/null; then
  echo "yay is not installed"

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

fi

yay -S --needed --noconfirm \
  discord \
  visual-studio-code-bin \
  intellij-idea-community-edition \
  google-chrome \
  brave-bin \
  bun-bin \
  uv \
  github-cli \
  kconf \
  bitwarden-cli \
  flameshot \
  coursier \
  gitleaks \
  hadolint-bin
