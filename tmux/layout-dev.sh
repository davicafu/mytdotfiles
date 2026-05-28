#!/usr/bin/env bash

SESSION="dev"

tmux new-session -d -s "$SESSION" -n "shell"

tmux new-window -t "$SESSION:" -n "workspace"

tmux select-window -t "$SESSION:workspace"

tmux split-window -h
tmux split-window -v -t "$SESSION:workspace.1"

tmux select-pane -t "$SESSION:workspace.0"

tmux attach -t "$SESSION"
