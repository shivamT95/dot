#! /usr/bin/env zsh

source ~/.dot/variables.zsh

if [[ -z $DISPLAY && $XDG_VTNR == 1 ]] && (( $+commands[sway] )); then
    exec sway
fi
