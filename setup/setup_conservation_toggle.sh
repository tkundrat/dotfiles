#!/bin/bash

REPO_DIR=$(git rev-parse --show-toplevel)
SRC_DIR="${REPO_DIR}/bin/conservation-toggle"
DST_DIR='/usr/local/bin/conservation-toggle'

sudo cp $SRC_DIR $DST_DIR
sudo chmod 755 $DST_DIR

echo 'add the following line to your sudoers file using visudo (swap out wheel \
if you are using another group like sudo):'
echo '%wheel ALL=(ALL:ALL) NOPASSWD: /usr/local/bin/conservation-toggle'