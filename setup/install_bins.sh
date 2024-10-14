#!/bin/bash

mkdir ~/bin/

wget https://github.com/marcothms/dots/raw/refs/heads/master/files/sway/.config/sway/screenshot --output-document ~/bin/screenshot

REPO_DIR=$(git rev-parse --show-toplevel)
ln -s 
