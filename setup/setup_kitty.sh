#!/bin/bash
if [[ $(which kitty) ]]; then
    KITTY_DIR=$HOME/.config/kitty
    
    # backing up existing kitty config and theme
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $KITTY_DIR/kitty.conf) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $KITTY_DIR/kitty.conf $OLD_DOTS_DIR/kitty.conf
    fi
    if [[ $(ls $KITTY_DIR/current-theme.conf) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $KITTY_DIR/current-theme.conf $OLD_DOTS_DIR/current-theme.conf
    fi
    
    # creating symlink
    REPO_DIR=$(git rev-parse --show-toplevel)
    ln -s $REPO_DIR/kitty/kitty.conf $KITTY_DIR/kitty.conf
    
    # write light theme to current theme
    ls $KITTY_DIR > /dev/null || mkdir --parents $KITTY_DIR
    cd $KITTY_DIR
    echo include $REPO_DIR/kitty/everforest-light-medium-theme.conf > $KITTY_DIR/current-theme.conf
else
    printf 'Error: kitty was not found on this system.' >&2
    exit 1
fi
