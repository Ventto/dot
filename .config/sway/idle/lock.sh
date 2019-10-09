#!/bin/sh

"$HOME"/.config/sway/idle/inhibitors/pulse.sh || exit 1

swaylock -e -f -n -c 000000 \
         -i "${HOME}/images/wallpapers/matin.png"
