#!/bin/bash

# X settings
xhost si:localuser:$USER

# Keybaord
setxkbmap fr

# Wallpaper
feh --bg-max --no-fehbg ~/.config/i3/wallpapers/wallpaper.jpg

# Notification deamon
dunst &

# Brightness
lux -m 30 -M 99 -S 20%

# Audio
amixer -q set Master mute

# Fading and transparency
#compton --config ~/.config/compton/compton.conf -b

# Window manager
exec i3 --shmlog-size=26214400
