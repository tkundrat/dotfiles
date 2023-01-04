#!/bin/bash

if [[ $(which vim) ]]; then
    # backing up existing config for vim and nvim
    OLD_DOTS_DIR=$HOME/old-dotfiles
    if [[ $(ls $HOME/.vimrc) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.vimrc $OLD_DOTS_DIR/.vimrc
    fi
    if [[ $(ls $HOME/.config/nvim/init.vim) ]]; then
        ls $OLD_DOTS_DIR > /dev/null || mkdir $OLD_DOTS_DIR
        mv $HOME/.config/nvim/init.vim $OLD_DOTS_DIR/.nvimrc
    fi
    
    # creating symlink
    REPO_DIR=$(cd .. && pwd)
    ln -s $REPO_DIR/vim/.vimrc $HOME/.vimrc
    
    # source .vimrc for nvim, if nvim installed
    which nvim > /dev/null && echo "source ~/.vimrc" > $HOME/.config/nvim/init.vim
else
    printf 'Error: vim was not found on this system.' >&2
    exit 1
fi
