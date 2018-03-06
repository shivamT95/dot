#! /usr/bin/env zsh

path=($HOME/.bin $path)
path=($HOME/.local/bin $path)
# path=('/usr/lib/smlnj/bin' $path)
export PATH

if (( $+commands[emacs] )); then
    export EDITOR='emacsclient -t'
    export ALTERNATE_EDITOR=""
    export VISUAL='emacsclient -c'
elif (( $+commands[nvim] )); then
    export EDITOR=nvim
elif (( $+commands[vim] )); then
    export EDITOR=vim
    if (( $+commands[gvim] )); then
        export VISUAL=gvim
    fi
elif (( $+commands[vi] )); then
    export EDITOR=vi
fi
export SUDO_EDITOR=$EDITOR

if (( $+commands[qutebrowser] )); then
    export BROWSER=qutebrowser
elif (( $+commands[google-chrome-stable] )); then
    export BROWSER=google-chrome-stable
elif (( $+commands[chromium] )); then
    export BROWSER=chromium
elif (( $+commands[firefox] )); then
    export BROWSER=firefox
fi

if [[ $(cat /proc/version) =~ "Microsoft" ]]; then
    export WSL=true

    # wsl and nice don't play nice
    unsetopt BG_NICE
fi

# fix pinentry-curses
export GPG_TTY=$(tty)
