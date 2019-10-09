#!/bin/sh

"$HOME"/.config/sway/idle/inhibitors/pulse.sh || exit 1

case $1 in
    low) lux -S 10%;;
    off) lux -S 0%;;
esac
