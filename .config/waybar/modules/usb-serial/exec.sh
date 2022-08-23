#!/bin/sh
#
# Prints the number of serial interfaces in waybar format:
#
#    "{text}\n{tooltip}\n{class}"
#
# Exit codes:
# - 0: Display the module's widget in the waybar
# - 1: Keep the module's widget hidden
#
. "$(dirname "$0")/../../lib/utils.sh"

waybar_action()
{
    declare -a lst=( $(ls -1 /dev | grep -E 'tty(USB|ACM)') )

    if [ "${#lst[@]}" -gt 0 ]; then
        printf '{"text":"%s","tooltip":"%s","class":"active"}' " x ${#lst[@]}" "$(waybar_tooltip "$lst")"
    else
        printf '{"text":"","tooltip":"","class":"inactive"}'
    fi
}

waybar_action
