#!/bin/sh

xhost si:localuser:$USER

# Mute bell
xset b off

# Keyboard
nohup numlockx > /dev/null 2>&1 &
setxkbmap fr

# Wallpaper
feh --bg-max --no-fehb5g "$HOME/images/wallpapers/fusion.jpg"

# Transparency
nohup compton > /dev/null 2>&1 &

# Notification server
nohup dunst > /dev/null 2>&1 &

# Brightness
lux -S 60%

# Audio
amixer -q set Master mute

# Monitor display manager
nohup mons -m > /dev/null 2>&1 &

# Window manager
exec i3 --shmlog-size=26214400
