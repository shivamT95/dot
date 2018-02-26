#! /usr/bin/env zsh

# Consult gh:unixorn/awesome-zsh-plugins
# Alphabetically ordered, except for zplug itself

zplug "zplug/zplug"

################################################################################
## oh-my-zsh plugins

# android debug bridge
zplug "plugins/adb", from:oh-my-zsh, if:"(( $+commands[adb] ))"

# aliases for yaourt and pacman
zplug "plugins/archlinux", from:oh-my-zsh, if:"(( $+commands[pacman] ))"

# completion for autopep8
zplug "plugins/autopep8", from:oh-my-zsh, if:"(( $+commands[autopep8] ))"

# background notifications for long running commands
zplug "plugins/bgnotify", from:oh-my-zsh

# haskell package manager
zplug "plugins/cabal", from:oh-my-zsh, if:"(( $+commands[cabal] ))"

# rust build tool
zplug "plugins/cargo", from:oh-my-zsh, if:"(( $+commands[cargo] ))"

# display images using catimg in terminal
zplug "plugins/catimg", from:oh-my-zsh

# Suggest package name for missing commands
zplug "plugins/command-not-found", from:oh-my-zsh

# Better completion interface
zplug "plugins/compleat", from:oh-my-zsh, if:"(( $+commands[compleat] ))"

# Copy current input buffer ($ ...) using ctrl-o
zplug "plugins/copybuffer", from:oh-my-zsh

# Debian/Ubuntu
zplug "plugins/debian", from:oh-my-zsh, \
    if:"(( $+commands[apt-get] || $+commands[apt] || $+commands[aptitude] ))"

# Go back and forward in dir stack using Ctrl-Shift-left/right
zplug "plugins/dircycle", from:oh-my-zsh

# Docker
zplug "plugins/docker", from:oh-my-zsh, if:"(( $+commands[docker] ))"
zplug "plugins/docker-compose", from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"

# text editor: emacs
zplug "plugins/emacs", from:oh-my-zsh, if:"(( $+commands[emacs] ))"

# encode64/decode64 from console
zplug "plugins/encode64", from:oh-my-zsh

# extract anything with 'x'
zplug "plugins/extract", from:oh-my-zsh

# quick-cast for 'bg' and 'fg'
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

# git plugins
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/git-extras", from:oh-my-zsh, if:"(( $+commands[git-extras] ))"
zplug "plugins/gitignore", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/github", from:oh-my-zsh, if:"(( $+commands[hub] ))"

# gnu-utils
zplug "plugins/gnu-utils", from:oh-my-zsh

# command history search
#zplug "plugins/history-substring-search", from:oh-my-zsh

# history
zplug "plugins/history", from:oh-my-zsh

# npm
zplug "plugins/npm", from:oh-my-zsh, if:"(( $+commands[npm] ))"

# pep8, pip, pylint, python
zplug "plugins/pep8", from:oh-my-zsh, if:"(( $+commands[pep8] ))"
zplug "plugins/pip", from:oh-my-zsh, \
    if:"(( $+commands[pip] || $+commands[pip2] || $+commands[pip3] ))"
zplug "plugins/pylint", from:oh-my-zsh, if:"(( $+commands[pylint] ))"
zplug "plugins/python", from:oh-my-zsh, \
    if:"(( $+commands[python] || $+commands[python2] || $+commands[python3] ))"

# rust
zplug "plugins/rust", from:oh-my-zsh, if:"(( $+commands[rustc] ))"

# safe-paste
zplug "plugins/safe-paste", from:oh-my-zsh

# sbt
zplug "plugins/sbt", from:oh-my-zsh, if:"(( $+commands[sbt] ))"

# scala
zplug "plugins/scala", from:oh-my-zsh, \
    if:"(( $+commands[sbt] || $+commands[scala] ))"

# stack.hs
zplug "plugins/stack", from:oh-my-zsh, if:"(( $+commands[stack] ))"

# sudo on esc-esc
zplug "plugins/sudo", from:oh-my-zsh

# systemctl
zplug "plugins/systemd", from:oh-my-zsh, if:"(( $+commands[systemctl] ))"

################################################################################
## custom plugins

# Multicolor terminal if available
#zplug "chrissicool/zsh-256color"

# syntax highlighting in prompt
zplug "zsh-users/zsh-syntax-highlighting"

# command history search matching buffer as prefix
zplug "zsh-users/zsh-history-substring-search"

# Remember aliases already defined
zplug "djui/alias-tips"

# Library for asynchronous tasks
#zplug "mafredri/zsh-async"

# Automatic pairing of delimiters
zplug "hlissner/zsh-autopair"

# Colored man pages
zplug "ael-code/zsh-colored-man-pages"

# Easy colorization
#zplug "Tarrasch/zsh-colors"

# solarized dircolors
zplug "joel-porquet/zsh-dircolors-solarized"

# fast jump to favorite directories
#zplug "seletskiy/zsh-favorite-directories"

# higher order functions
#zplug "Tarrasch/zsh-functional"

# Display hints right under the editing buffer (maybe later)
#zplug "joepvd/zsh-hints"

# Map exit status codes to human readable strings
#zplug "bric3/nice-exit-code"

# color urls based on http status (will need to script the install myself)
#zplug "ascii-soup/zsh-url-highlighter"

################################################################################
## oh-my-zsh libraries

# simple aliases for moving between directories
zplug "lib/directories", from:oh-my-zsh

# tweaks for dealing with history
zplug "lib/history", from:oh-my-zsh

################################################################################
