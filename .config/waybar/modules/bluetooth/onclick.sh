#!/bin/sh

termite -c "${HOME}/.config/termite/config_dmenu" \
        --name waybar-onclick \
        -e "zsh -c 'bluetoothctl'"
