#!/bin/sh
#
# Prints the number of external disks in waybar format:
#
#    "{text}\n{tooltip}\n{class}"
#
# The `INTERNAL_DISK_N` constant means the number of internal disks referenced
# into the lsblk command.
#
# Exit codes:
# - 0: Display the module's widget in the waybar
# - 1: Keep the module's widget hidden
#
set -e

INTERNAL_DISK_N=1

waybar_module()
{
    extern_disk_n="$(echo "$(lsblk -r | grep -c ' disk') - ${INTERNAL_DISK_N}" | bc)"

    [ "$extern_disk_n" -eq 0 ] && exit 1

    printf "%s\n%s\nclass" "$extern_disk_n" \
           "$(lsblk | grep -E ' disk' | awk '{print $1}' | \
              xargs -I {} printf '/dev/{}')"
}

waybar_module
