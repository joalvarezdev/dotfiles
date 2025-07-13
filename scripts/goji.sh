#!/bin/bash

set -e

if command -v goji &>/dev/null; then
  exit 0
fi

DIR="/tmp/goji"

mkdir -p "$DIR"
cd "$DIR"

git clone https://github.com/muandane/goji.git && cd goji

go build -ldflags "-s -w -X goji/cmd.version=0.0.8"

sudo mv goji /usr/local/bin

rm -rf "$DIR"

goji --version
