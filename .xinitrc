#!/bin/sh

xhost si:localuser:$USER

# Keyboard
nohup numlockx > /dev/null 2>&1 &
setxkbmap fr

# Wallpaper
feh --bg-max --no-fehbg ~/.config/i3/wallpapers/wallpaper.jpg

# Notification server
nohup dunst > /dev/null 2>&1 &

# Brightness
lux -m 30 -M 99 -S 20%

# Audio
amixer -q set Master mute

# Monitor display manager
nohup mons -m > /dev/null 2>&1 &

# Window manager
exec i3 --shmlog-size=26214400
