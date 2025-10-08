#!/bin/bash

if [[ $(which git) ]]; then
    # backing up existing config for git
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $HOME/.gitconfig) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.gitconfig $OLD_DOTS_DIR/.gitconfig
    fi
    
    # creating symlink
    REPO_DIR=$(git rev-parse --show-toplevel)
    ln -s $REPO_DIR/git/.gitconfig $HOME/.gitconfig
    
else
    printf 'Error: git was not found on this system.' >&2
    exit 1
fi
