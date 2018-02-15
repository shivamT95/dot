#! /usr/bin/env zsh

export morrowind='139.59.4.199'

function morrowind () {
    if [[ $TERM == xterm* ]]; then
        env TERM=xterm-256color ssh root@${morrowind}
    else
        ssh root@${morrowind}
    fi
}
