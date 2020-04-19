#!/usr/bin/env bash

if [ '#W' == 'bash' ]; then
  tmux rename-window "char"
else
  tmux rename-window "bar"
fi
