#!/bin/bash

if [[ -z "$TMUX" ]]; then
  tmux attach-session -t JoAlvarez || tmux new-session -s JoAlvarez
fi
# Asegurarse de que no estamos ya dentro de tmux
# if [[ -z "$TMUX" ]]; then
#   # Usar exec para reemplazar el proceso bash por tmux
#   exec tmux attach-session -t JoAlvarez || exec tmux new-session -s JoAlvarez
# fi
