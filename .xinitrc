#!/bin/sh

setxkbmap fr

# Lock Screen before suspending
xss-lock -- /usr/bin/i3lock -e -f -n -c 000000 \
                            -i "${HOME}/images/wallpapers/matin.png" &

# Wallpaper
feh --bg-max --no-fehbg "${HOME}/images/wallpapers/fusion.jpg"

# Transparency
nohup xcompmgr -c -f -n > /dev/null 2>&1 &

# Notification server
nohup dunst > /dev/null 2>&1 &

# Brightness
lux -S 60%

# Audio
amixer -q set Master mute

# Monitor display manager
nohup mons -m > /dev/null 2>&1 &

# Window manager
exec i3 -c "${HOME}/.config/i3/config" --shmlog-size=26214400
