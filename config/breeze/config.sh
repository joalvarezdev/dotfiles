#!/bin/bash

if [ -d "$HOME/.scm_breeze" ]; then
  exit 0
fi

if [ ! -d "$HOME/ghq/github.com/scmbreeze/" ]; then
  ghq get https://github.com/scmbreeze/scm_breeze.git
fi

"$(ghq root)/github.com/scmbreeze/scm_breeze/install.sh"
