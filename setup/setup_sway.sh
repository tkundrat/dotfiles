#!/bin/bash

if [[ $(which sway && which waybar) ]]; then
    # backing up existing config for vim and nvim
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $HOME/.config/sway/config) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.config/sway/config $OLD_DOTS_DIR/sway-config
        mv $HOME/.config/waybar/config $OLD_DOTS_DIR/waybar-config
        mv $HOME/.config/waybar/style.css $OLD_DOTS_DIR/waybar-style.css
    fi
    
    # creating symlink
    REPO_DIR=$(git rev-parse --show-toplevel)
    mkdir -p $HOME/.config/waybar/
    ln -s $REPO_DIR/sway/config $HOME/.config/sway/config
    ln -s $REPO_DIR/waybar/config $HOME/.config/waybar/config
    ln -s $REPO_DIR/waybar/style.css $HOME/.config/waybar/style.css
else
    printf 'Error: sway and/or waybar was not found on this system.' >&2
    exit 1
fi
