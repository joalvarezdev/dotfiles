#!/bin/bash

if ! command -v nvm &>/dev/null; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

source ~/.bashrc

version="v18.18.2"

if ! node -v | grep -q "$version"; then
	nvm install v18.18.2
fi
