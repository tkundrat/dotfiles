#!/bin/bash

# backing up existing bashrc
OLD_DOTS_DIR=$HOME/old-dotfiles
if [[ $(ls $HOME/.tmux.conf) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $HOME/.tmux.conf $OLD_DOTS_DIR/.tmux.conf
fi
if [[ $(ls $HOME/.tmux.theme) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $HOME/.tmux.theme $OLD_DOTS_DIR/.tmux.theme
fi

# creating symlink
REPO_DIR=$(cd .. && pwd)
ln -s $REPO_DIR/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $REPO_DIR/tmux/.tmux.theme $HOME/.tmux.theme
