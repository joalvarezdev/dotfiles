#!/bin/bash

 # Limpiar sesiones huérfanas (sin attached)
tmux list-sessions -F '#{session_name} #{session_attached}' 2>/dev/null | while read -r session attached; do
    if [ "$attached" -eq 0 ]; then
        tmux kill-session -t "$session"
    fi
done

session_name="JoAlvarez-$(date +%H%M%S)"
tmux new-session -s "$session_name"
