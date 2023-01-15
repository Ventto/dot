#!/usr/bin/env bash

MODULE_NAME="custom/do-not-disturb"
DESC="${MODULE_NAME}: toggles notifications from mako"

function mako_running() {
    pgrep -u "$(id -u)" -l mako > /dev/null
}

function waybar_return_err() {
    printf '{"text": " error", "alt": "error", "class": "critical", "tooltip": "%s\n%s"}' \
           "$DESC" "$@"
    exit 0
}

function waybar_return() {
    local class=""
    local mode
    local alt

    mode=$(makoctl mode | tail -n 1)
    case "$mode" in
        do-not-disturb) alt="enabled"; class="warning";;
        *) alt="disabled";;
    esac

    printf '{"text": "", "alt": "%s", "class": "%s", "tooltip": "%s"}' \
           "$alt" "$class" "$DESC"
    exit 0
}

function main() {
    if ! mako_running; then
        waybar_return_err "mako is not running"
    fi
    waybar_return
}
main
