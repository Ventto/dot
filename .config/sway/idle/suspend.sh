#!/bin/sh

"${HOME}"/.config/sway/idle/inhibitors/powersupplyadapter_used.sh && exit 1
"${HOME}"/.config/sway/idle/inhibitors/pulseaudio_used.sh && exit 1

systemctl suspend
