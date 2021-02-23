#!/bin/sh

echo "Checking monitors..."
count="$(swaymsg -t get_outputs | grep -c '"name":')"
if [ "$count" -ne 1 ]; then
    exit 0
fi
swaymsg "output * enable"
