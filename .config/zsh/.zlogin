#!/bin/zsh

systemctl --user enable ssh-agent

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
