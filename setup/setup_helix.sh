#!/bin/bash

if [[ $(which helix || which hx) ]]; then
    # backing up existing config for helix
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $HOME/.config/helix) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.config/helix $OLD_DOTS_DIR/helix
    fi
    
    # creating symlink
    REPO_DIR=$(git rev-parse --show-toplevel)
    ln -s $REPO_DIR/helix $HOME/.config/helix
    
else
    printf 'Error: helix was not found on this system.' >&2
    exit 1
fi
