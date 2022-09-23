#!/usr/bin/env bash
#
# Run waybar and the blueman's applet that require waybar running.
# So it must be start after waybar.
#
set -e

killall blueman-applet || true
killall waybar || true
# Wayland status bars
nohup waybar >"/tmp/${USER}_waybar.log" 2>&1 &
# Bluetooth manager applet
nohup env QT_QPA_PLATFORM=xcb \
    blueman-applet >"/tmp/${USER}_blueman-applet.log" 2>&1 &
