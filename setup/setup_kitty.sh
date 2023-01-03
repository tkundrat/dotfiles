#!/bin/bash
KITTY_DIR=$HOME/.config/kitty

# backing up existing kitty config and theme
OLD_DOTS_DIR=$HOME/old-dotfiles
if [[ $(ls $KITTY_DIR/kitty.conf) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $KITTY_DIR/kitty.conf $OLD_DOTS_DIR/kitty.conf
fi
if [[ $(ls $KITTY_DIR/current-theme.conf) ]]; then
    ls $OLD_DOTS_DIR || mkdir $OLD_DOTS_DIR
    mv $KITTY_DIR/current-theme.conf $OLD_DOTS_DIR/current-theme.conf
fi

# creating symlink
REPO_DIR=$(cd .. && pwd)
ln -s $REPO_DIR/kitty/kitty.conf $KITTY_DIR/kitty.conf

# write light theme to current theme
ls $HOME/.config/kitty || mkdir --parents .config/kitty
cd $HOME/.config/kitty
echo include $REPO_DIR/kitty/everforest-light-medium-theme.conf > $KITTY_DIR/current-theme.conf
