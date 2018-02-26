#! /usr/bin/env zsh

path=($HOME/.bin $path)
path=($HOME/.local/bin $path)
# path=('/usr/lib/smlnj/bin' $path)
export PATH

if (( $+commands[emacs] )); then
    export EDITOR='emacsclient -t'
    export ALTERNATE_EDITOR=""
    export SUDO_EDITOR=$EDITOR
    export VISUAL='emacsclient -c'
elif (( $+commands[nvim] )); then
    export EDITOR=nvim
    export SUDO_EDITOR=nvim
elif (( $+commands[vim] )); then
    export EDITOR=vim
    export SUDO_EDITOR=vim
    if (( $+commands[gvim] )); then
        export VISUAL=gvim
    fi
elif (( $+commands[vi] )); then
    export EDITOR=vi
    export SUDO_EDITOR=vi
fi

if (( $+commands[qutebrowser] )); then
    export BROWSER=qutebrowser
elif (( $+commands[google-chrome-stable] )); then
    export BROWSER=google-chrome-stable
elif (( $+commands[chromium] )); then
    export BROWSER=chromium
elif (( $+commands[firefox] )); then
    export BROWSER=firefox
fi
