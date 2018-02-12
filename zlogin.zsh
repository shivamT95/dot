#! /usr/bin/env zsh

if [[ -z $DISPLAY && $XDG_VTNR == 1 ]] && (( $+commands[sway] )); then
    export WLC_REPEAT_DELAY=300
    export WLC_REPEAT_RATE=30
    exec sway
fi
