#!/usr/bin/env bash

set -e

# Install zsh, sway, firefox, alacrity, nvim, git, docker, bitwarden, grimshot

# SSH agent shared across the graphical session
systemctl --user enable ssh-agent

# Simple focus animations for tiling window managers
systemctl --user enable flashfocus

systemctl --user enable mako

systemctl --user enable blueman-applet

systemctl --user enable waybar

systemctl --user enable nm-applet

systemctl --user enable redshift

ln -s /usr/share/zsh-theme-powerlevel10k .local/share/powerlevel10k
