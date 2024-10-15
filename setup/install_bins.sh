#!/bin/bash

mkdir ~/bin/

wget https://github.com/marcothms/dots/raw/refs/heads/master/files/sway/.config/sway/screenshot --output-document ~/bin/screenshot
chmod +x ~/bin/screenshot

REPO_DIR=$(git rev-parse --show-toplevel)
cp -r $REPO_DIR/bin/* ~/bin/
