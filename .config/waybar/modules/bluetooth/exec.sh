#!/bin/sh
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

waybar_module()
{
    if rfkill | grep 'bluetooth.* blocked'; then
        printf " x\n\n"
    else
        if ! systemctl status bluetooth | \
            grep 'active (running)' >/dev/null 2>&1;
        then
            printf " !\n\n"
        else
            msg="$(bluetoothctl paired-devices | cut -d' ' -f3-)"
            printf "\n%s\n" "$(waybar_tooltip "$msg")"
        fi
    fi
    ##
    # For now, I do not know what to do with class property.
    # Writing just "class" does not raise any error.
    printf "class"
}

waybar_module
