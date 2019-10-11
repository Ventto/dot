#!/bin/sh
#
# Converts a multi-lines string to fit a waybar's tooltip
#
# $1: String
#
# returns: String
#
waybar_tooltip()
{
    [ -z "$1" ] && return
    [ "$(echo "$1" | wc -l)" -eq 1 ] && { printf '%s\n' "$1"; return; }

    echo "$1" | while read -r line; do
        count="${#line}"
        [ "$count" -lt 69 ] && line="${line}$(printf "%$((69 - count))s")"
        printf '%s' "$line "
    done
}
