#!/bin/bash

if [ ! -d "$HOME/.nvm" ]; then
  source /usr/share/nvm/init-nvm.sh

  nvm install --lts
fi
