#! /usr/bin/env zsh

if [[ $(cat /proc/version) =~ "Microsoft" ]]; then
    WSL=$(true)
fi

# wsl and nice don't play nice
if [[ $WSL ]]; then
    unsetopt BG_NICE
fi
