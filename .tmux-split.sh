#!/bin/bash
tmux split-window -h
tmux split-window -h
tmux select-layout even-horizontal

tmux select-pane -t 1
tmux send-keys "exit" C-m

tmux select-pane -t 2
tmux split-window -v
tmux select-pane -t 0
tmux send-keys "vim" C-m
