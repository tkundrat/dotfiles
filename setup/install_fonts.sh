#!/bin/bash

# copy all fonts to user fonts directory
REPO_DIR=$(cd .. && pwd)
ls $HOME/.fonts > /dev/null || mkdir $HOME/.fonts # create .fonts if not there
cp $REPO_DIR/fonts/* $HOME/.fonts
