#!/usr/bin/env bash

buffer_name="$1"
paths=$(yazi "$buffer_name" --chooser-file=/dev/stdout)

if [[ -n "$paths" ]]; then
    tmux last-window
    tmux send-keys Escape
    tmux send-keys ":o $paths"
    tmux send-keys Enter
else
    tmux kill-window -t fx
fi
