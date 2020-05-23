#!/bin/bash
#
# Prints the bluetooth controller's status in waybar format and exit-zero:
#
#    "{text}\n{tooltip}\n{class}"
#
# Exit codes:
# - 0: Display the module's widget in the waybar
# - 1: Keep the module's widget hidden
#
set -e

. "$(dirname "$0")/../../lib/utils.sh"

bth_connected()
{
    local _mac="$1"

    bluetoothctl info "${_mac}" | grep 'Connected: yes' > /dev/null 2>&1
}

bth_on() {
    if rfkill | grep 'bluetooth.* blocked' >/dev/null 2>&1; then
        return 1
    fi
    return 0
}

bth_enabled() {
    if systemctl status bluetooth | grep 'active (running)' >/dev/null 2>&1
    then
        return 0
    fi
    return 1
}

bth_connected_list()
{
    declare -a mac_lst

    mac_lst=( $(bluetoothctl devices | cut -d' ' -f2) )

    for mac in "${mac_lst[@]}"
    do
        if bth_connected "$mac"; then
            bluetoothctl info "$mac" | sed -n 's%.*Name: \(.*\)%\1%p'
        fi
    done
}

waybar_action()
{
    if bth_on; then
        if bth_enabled; then
            declare -a list
            list=( $(bth_connected_list) )
            if [ "${#list[@]}" -gt 0 ]; then
                printf '{"text":"%s","tooltip":"%s","class":"on"}' \
                       "x ${#list[@]}" \
                       "$(waybar_tooltip "${list[@]}")"
            else
                printf '{"text":" x 0","tooltip":"%s","class":"on"}' \
                       "No device connected"
            fi
        else
            printf '{"text":" ","tooltip":"%s","class":"on"}' \
                   "Bluetooth is disabled"
        fi
    else
        printf '{"text":"","tooltip":"%s","class":"off"}' "Bluetooth is off"
    fi
}

waybar_action
