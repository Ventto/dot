#!/bin/bash

xhost si:localuser:$USER

setxkbmap fr

feh --bg-max --no-fehbg ~/.config/i3/wallpapers/wallpaper.jpg

# To enable fading and transparency
compton --config ~/.config/compton/compton.conf -b

# To enable the notification deamon
dunst &

# Brightness 20%
#lux -m 30 -M 99 -S 20%

amixer -q set Master mute

exec i3 --shmlog-size=26214400
