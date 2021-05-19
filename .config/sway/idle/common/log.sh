#!/bin/sh

prog="$(basename "$(dirname "$0")")/$(basename "$0")"

log()
{
    printf "%s: %s: %s\n" "$(date)" "$prog" "$@"
}
