#! /usr/bin/env zsh

# run 'ls' on empty line, lowercase otherwise
_magic-alt-l () {
    if [[ -z $BUFFER ]]; then
        BUFFER="ls"
        zle accept-line
    else
        zle down-case-word
    fi
}
zle -N _magic-alt-l

bindkey '\el' _magic-alt-l

# open ranger
#bindkey '\er' exec ranger
