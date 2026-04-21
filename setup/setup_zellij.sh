#!/bin/bash

if [[ $(which zellij) ]]; then
    # backing up existing config for vim and nvim
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $HOME/.config/zellij/config.kdl) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.config/zellij/config.kdl $OLD_DOTS_DIR/config.kdl
    fi
    
    # creating symlink
    REPO_DIR=$(git rev-parse --show-toplevel)
    mkdir -p $HOME/.config/zellij
    ln -s $REPO_DIR/zellij/config.kdl $HOME/.config/zellij/config.kdl
else
    printf 'Error: zellij was not found on this system.' >&2
    exit 1
fi
