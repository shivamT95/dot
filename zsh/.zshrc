#! /usr/bin/env zsh

# Extend config by yet another script
[[ -f ~/.custom.before.zsh ]] && source ~/.custom.before.zsh

# Add custom completions
fpath=(~/.zsh/completions $fpath)

# Ensure that zplug is installed
if [[ ! -d ~/.zplug ]]; then
    echo 'Trying to install zplug using ~/.bin/zplug-install'
    ~/.bin/zplug-install || return 1
fi

# Load zplug
source ~/.zplug/init.zsh

# Editing settings
autoload -U select-word-style
select-word-style bash

# zplug packages
source ~/.zsh/bundles.zsh

# install zplug packages in parallel
if ! zplug check; then
    zplug install
fi

# Tell zplug we're done
zplug load

# Read env variables
source ~/.zsh/variables.zsh

# Custom commands
source ~/.zsh/commands.zsh

# Custom keybinds
source ~/.zsh/keybinds.zsh

# grml prompt settings
zstyle :prompt:grml:right:setup items time

# Make completions use LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Extend config by yet another script
[[ -f ~/.custom.after.zsh ]] && source ~/.custom.after.zsh
