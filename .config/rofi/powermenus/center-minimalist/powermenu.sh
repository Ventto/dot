#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="${XDG_CONFIG_HOME}/rofi/powermenus/center-minimalist"
theme="harmo"

# CMDs
lastlogin="$(last "$USER" | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7)"
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
hibernate=''
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

rofi_cmd() {
	rofi -dmenu \
		-p "$USER@$host" \
		-mesg " Last Login: $lastlogin |  Uptime: $uptime" \
		-theme "${dir}/${theme}.rasi"
}

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "${dir}/${theme}.rasi"
}

run_confirm() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi_cmd
}
# Execute Command
ask_run_cmd() {
	selected="$(run_confirm)"
	if [[ "$selected" == "$yes" ]]; then
        case $1 in
            --shutdown) systemctl poweroff;;
		    --reboot) systemctl reboot;;
            --hibernate) systemctl hibernate;;
            --suspend) mpc -q pause
			           amixer set Master mute
			           systemctl suspend;;
            --logout) wlogout;;
        esac
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case $chosen in
    "$shutdown")  ask_run_cmd --shutdown;;
    "$reboot")    ask_run_cmd --reboot;;
    "$hibernate") ask_run_cmd --hibernate;;
    "$lock")      lock;;
    "$suspend")   ask_run_cmd --suspend;;
    "$logout")    ask_run_cmd --logout;;
esac
