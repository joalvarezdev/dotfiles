#!/bin/bash

if [[ -z "$TMUX" ]]; then
  tmux attach-session -t JoAlvarez || tmux new-session -s JoAlvarez
fi
