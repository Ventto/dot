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
set -e

. "$(dirname "$0")/lib/utils.sh"

waybar_module()
{
    out="$(echo "/dev/ttyUSB0" | grep -E 'tty(USB|ACM)')"

    [ -z "$out" ] && exit 1

    serial_n="$(echo "$out" | wc -l)"

    printf "%s\n%s\nclass" "$serial_n" "$(waybar_tooltip "$out")"
}

waybar_module
