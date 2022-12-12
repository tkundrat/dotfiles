#!/bin/bash

# backing up existing bashrc
OLD_DOTS_DIR=$HOME/old-dotfiles
if [[ $(ls $HOME/.bashrc) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $HOME/.bashrc $OLD_DOTS_DIR/.bashrc
fi

# creating symlink
REPO_DIR=$(cd .. && pwd)
ln -s $REPO_DIR/shell/.bashrc $HOME/.bashrc
