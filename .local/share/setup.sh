#!/usr/bin/env bash

set -e 

# SSH agent shared across the graphical session
systemctl --user enable ssh-agent

# Simple focus animations for tiling window managers
systemctl --user enable flashfocus
