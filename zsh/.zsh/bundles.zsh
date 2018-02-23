#! /usr/bin/env zsh

# Consult gh:unixorn/awesome-zsh-plugins
# Alphabetically ordered, except for zplug itself

zplug "zplug/zplug"

################################################################################
## oh-my-zsh plugins

# aliases for yaourt and pacman
zplug "plugins/archlinux", from:oh-my-zsh, if:"(( $+commands[pacman] ))"

# haskell package manager
zplug "plugins/cabal", from:oh-my-zsh, if:"(( $+commands[cabal] ))"

# display images using catimg in terminal
zplug "plugins/catimg", from:oh-my-zsh

# Suggest package name for missing commands
zplug "plugins/command-not-found", from:oh-my-zsh

# Better completion interface
zplug "plugins/compleat", from:oh-my-zsh

# Debian/Ubuntu
zplug "plugins/debian", from:oh-my-zsh, \
    if:"(( $+commands[apt-get] || $+commands[apt] || $+commands[aptitude] ))"

# Go back and forward in dir stack using Ctrl-Shift-left/right
zplug "plugins/dircycle", from:oh-my-zsh

# encode64/decode64 from console
zplug "plugins/encode64", from:oh-my-zsh

# emacs
zplug "plugins/extract", from:oh-my-zsh

# git plugins
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/git-extras", from:oh-my-zsh, if:"(( $+commands[git-extras] ))"
zplug "plugins/gitignore", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/github", from:oh-my-zsh, if:"(( $+commands[hub] ))"

# gnu-utils
zplug "plugins/gnu-utils", from:oh-my-zsh

# history
zplug "plugins/history", from:oh-my-zsh

# npm
zplug "plugins/npm", from:oh-my-zsh, if:"(( $+commands[npm] ))"

# pip
zplug "plugins/pip", from:oh-my-zsh, \
    if:"(( $+commands[pip] || $+commands[pip2] || $+commands[pip3] ))"

# python
zplug "plugins/python", from:oh-my-zsh, \
    if:"(( $+commands[python] || $+commands[python2] || $+commands[python3] ))"

# sbt
zplug "plugins/sbt", from:oh-my-zsh, if:"(( $+commands[sbt] ))"

# scala
zplug "plugins/scala", from:oh-my-zsh, \
    if:"(( $+commands[sbt] || $+commands[scala] ))"

# stack.hs
zplug "plugins/stack", from:oh-my-zsh, if:"(( $+commands[stack] ))"

# systemctl
zplug "plugins/systemd", from:oh-my-zsh, if:"(( $+commands[systemctl] ))"

# sudo on esc-esc
zplug "plugins/sudo", from:oh-my-zsh

# theme changer (irrelevant after grml)
#zplug "plugins/themes", from:oh-my-zsh

################################################################################
## custom plugins

# Multicolor terminal if available
zplug "chrissicool/zsh-256color"

# syntax highlighting in prompt
zplug "zsh-users/zsh-syntax-highlighting"

# Remember aliases already defined
zplug "djui/alias-tips"

# Library for asynchronous tasks
#zplug "mafredri/zsh-async"

# Automatic pairing of delimiters
zplug "hlissner/zsh-autopair"

# Colored man pages
zplug "ael-code/zsh-colored-man-pages"

# Easy colorization
zplug "Tarrasch/zsh-colors"

# solarized dircolors
zplug "joel-porquet/zsh-dircolors-solarized"

# fast jump to favorite directories
#zplug "seletskiy/zsh-favorite-directories"

# higher order functions
#zplug "Tarrasch/zsh-functional"

# Display hints right under the editing buffer (maybe later)
#zplug "joepvd/zsh-hints"

# Map exit status codes to human readable strings
zplug "bric3/nice-exit-code"

# Notifications for long running (>30s) commands
#zplug "marzocchi/zsh-notify"

# safe-paste plugin
zplug "oz/safe-paste"

# color urls based on http status (will need to script the install myself)
#zplug "ascii-soup/zsh-url-highlighter"

################################################################################
## oh-my-zsh libraries

# simple aliases for moving between directories
zplug "lib/directories", from:oh-my-zsh
#
# tweaks for dealing with history
zplug "lib/history", from:oh-my-zsh

################################################################################
