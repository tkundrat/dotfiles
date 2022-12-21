#!/bin/bash

# backing up existing bashrc and powerline
OLD_DOTS_DIR=$HOME/old-dotfiles
if [[ $(ls $HOME/.bashrc) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $HOME/.bashrc $OLD_DOTS_DIR/.bashrc
fi
if [[ $(ls $HOME/.bash-powerline.sh) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $HOME/.bash-powerline.sh $OLD_DOTS_DIR/.bash-powerline.sh
fi

# creating symlink
REPO_DIR=$(cd .. && pwd)
ln -s $REPO_DIR/shell/.bashrc $HOME/.bashrc
ln -s $REPO_DIR/shell/.bash-powerline.sh $HOME/.bash-powerline.sh
