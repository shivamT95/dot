#! /usr/bin/env zsh

SCRIPTCONF=$( cd $( dirname ${(%):-%x} ) && pwd )

if [[ $SCRIPTCONF != $HOME/.dot ]]; then
    echo "Please move the repository to ~/.dot before running setup.zsh"
    exit 1
fi

# Check CONFDIRS
for CONFPATH in ~/.dot/config/* ; do
    CONF="$(basename "$CONFPATH")"
    TARGET=~/.config/$CONF
    if [[ -d $TARGET || -f $TARGET ]]; then
        if [[ $1 == "--replace" ]]; then
            if [[ -h $TARGET ]]; then
                rm $TARGET
            else
                rm -rf $TARGET
            fi
        else
            echo "Directory ~/.config/$CONF already exists. Use --replace to ignore. Exiting."
        fi
    fi
done

# create link from ~/.dot/$file at ~/.$file (strip .zsh$)
DOTFILES=(spacemacs gitconfig zshrc.zsh 'zshrc.local.zsh' zsh-dircolors.config zlogin.zsh)

# Check DOTFILES
for FILE in $DOTFILES ; do
    NAME="$(basename $FILE .zsh)"
    if [[ -f ~/.$NAME || -h ~/.$NAME ]]; then
        if [[ $1 == "--replace" ]]; then
            rm ~/.$NAME
        else
            echo "File ~/.$NAME already exists. Use --replace to ignore. Exiting."
            exit 1
        fi
    fi
done

# Symlink CONFDIRS
for CONFPATH in ~/.dot/config/* ; do
    CONF="$(basename $CONFPATH)"
    mkdir -p ~/.config
    ln -sT $HOME/.dot/config/$CONF $HOME/.config/$CONF
done

# Symlink DOTFILES
for FILE in $DOTFILES ; do
    NAME="$(basename $FILE .zsh)"
    DOT=$HOME/.dot/$FILE
    TARGET=$HOME/.$NAME
    if [[ -f $DOT || -d $DOT ]]; then
        ln -sT $DOT $TARGET
    fi
done

local function zplug_install () {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

# Install zplug.sh
if [[ -d ~/.zplug ]]; then 
    echo -n "~/.zplug exists. Remove and install zplug? [y/N]: "
    read -q -r REPLY
    echo
    if [[ $REPLY =~ "^[Yy]$" ]]; then
        rm -rf ~/.zplug
        zplug_install
    fi
else
    zplug_install
fi
