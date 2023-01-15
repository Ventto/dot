#!/bin/zsh

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
    sway-user-service
fi
