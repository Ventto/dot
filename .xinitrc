#!/bin/sh

# Lock Screen before suspending
xss-lock -- /usr/bin/i3lock -e -f -n -c 000000 \
                            -i "${HOME}/images/wallpapers/matin.png" &

# Wallpaper
feh --bg-max --no-fehbg "${HOME}/images/wallpapers/fusion.jpg"

# Notification server
nohup dunst -c "${HOME}/.config/dunst/dunstrc_x11" > /dev/null 2>&1 &

# Brightness
lux -S 60%

# Audio
amixer -q set Master mute

# Monitor display manager
nohup mons -m > /dev/null 2>&1 &

#Keyboard
xkbcomp -w 0 .config/xkb/x11/myus "$DISPLAY"

# Window manager
exec i3 -c "${HOME}/.config/i3/config" --shmlog-size=26214400
