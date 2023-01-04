#!/bin/bash

ls ~/.darkmode > /dev/null || touch ~/.darkmode

if [[ $(which kitty) ]]; then
    CURR_THEME_OLD=$(cat ~/.config/kitty/current-theme.conf)
    CURR_THEME_NEW=$(echo $CURR_THEME_OLD | sed -e 's/light/dark/')
    echo $CURR_THEME_NEW > ~/.config/kitty/current-theme.conf
fi
