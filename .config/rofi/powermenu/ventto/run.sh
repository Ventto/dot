#!/usr/bin/env bash

# Current Theme
cdir="$(dirname "$(realpath -L "$0")")"
theme="style"

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme "${cdir}/${theme}.rasi"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    "$shutdown") systemctl poweroff ;;
    "$reboot") systemctl reboot ;;
    "$lock") lock ;;
    "$suspend")
		mpc -q pause
		amixer set Master mute
		systemctl suspend
        ;;
    "$logout")
        if [[ -n $SWAYSOCK ]]; then
            swaymsg exit
        fi
        logout
        ;;
esac
