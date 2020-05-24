#!/bin/sh

"${HOME}"/.config/sway/idle/inhibitors/pulseaudio_used.sh && exit 1

timeout "$SCREEN_OFF_TIMEOUT" "swaymsg 'output * disable'"
