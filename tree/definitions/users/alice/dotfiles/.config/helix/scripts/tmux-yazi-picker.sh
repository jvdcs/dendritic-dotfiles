#!/usr/bin/env bash
buffer_name="$1"
tmpfile=$(mktemp)
yazi "$buffer_name" --chooser-file="$tmpfile"

if [[ -s "$tmpfile" ]]; then
    tmux last-window
    tmux send-keys Escape
    tmux send-keys ":open %sh{tr '\n' ' ' < $tmpfile; rm -f $tmpfile}"
    tmux send-keys Enter
else
    rm -f "$tmpfile"
    tmux kill-window -t fx
fi
