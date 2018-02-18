#! /usr/bin/env zsh

# Extend config by yet another script
[[ -f ~/.custom.before.zsh ]] && source ~/.custom.before.zsh

# Add custom completions
fpath=(~/.dot/completions $fpath)

# Load zplug
source ~/.zplug/init.zsh

# Editing settings
autoload -U select-word-style
select-word-style bash

# zplug packages
source ~/.dot/bundles.zsh

# install zplug packages in parallel
if ! zplug check; then
    zplug install
fi

# Tell zplug we're done
zplug load

# Custom env variables
source ~/.dot/variables.zsh

# Custom commands
source ~/.dot/commands.zsh

# Custom keybinds
source ~/.dot/keybinds.zsh

# grml prompt settings
zstyle :prompt:grml:right:setup items time

# Make completions use LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Extend config by yet another script
[[ -f ~/.custom.after.zsh ]] && source ~/.custom.after.zsh
