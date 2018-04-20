#! /usr/bin/env zsh

# extend config by yet another script
if [[ -f ~/.custom.before.zsh ]]; then
    source ~/.custom.before.zsh
fi

# read env variables
source ~/.zsh/variables.zsh

# add custom completions
fpath=(~/.zsh/completions $fpath)

# source antigen, load bundles only if it exists
source /usr/share/zsh/share/antigen.zsh && antigen init ~/.antigenrc

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
