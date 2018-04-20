#! /usr/bin/env zsh

# extend config by yet another script
if [[ -f ~/.custom.before.zsh ]]; then
    source ~/.custom.before.zsh
fi

# read env variables
source ~/.zsh/variables.zsh

# add custom completions
fpath=(~/.zsh/completions $fpath)

# load antigen
source ~/.zsh/antigen/antigen.zsh

# load bundles from antigen config
antigen init ~/.antigenrc

# custom commands
source ~/.zsh/commands.zsh

# custom keybinds
source ~/.zsh/keybinds.zsh

# make completions use LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# extend config by yet another script
if [[ -f ~/.custom.after.zsh ]]; then
    source ~/.custom.after.zsh
fi
