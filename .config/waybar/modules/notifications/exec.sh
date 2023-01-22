#!/usr/bin/env bash

declare -a IGNORE_APPNAMES=( volumectl backlightctl )

function mako_running() {
    pgrep -u "$(id -u)" -l mako > /dev/null
}

function mako_notification_appname_filter() {
    local json="$*"
    local compare=""
    for app in "${IGNORE_APPNAMES[@]}"; do
        compare+=",\"${app}\""
    done
    echo "$json" \
        | jq "del(.data[][] | select(.\"app-name\".data == (\"@\"${compare})))"
}

function mako_notification_filter() {
    mako_notification_appname_filter "$*"
}

function mako_notification_count() {
    mako_notification_filter "$(makoctl list)" | grep -oE app-name | wc -w
}

function waybar_return_err() {
    printf '{"text": " error", "alt": "error", "class": "critical", "tooltip": "%s"}' \
           "$@"
    exit 0
}

function waybar_return() {
    local class=""
    local count
    local text

    count=$(mako_notification_count)
    case "$count" in
        0) text=""; class="invisible" ;;
        1) text="${count} notification" ;;
        *) text="${count} notifications" ;;
    esac

    printf '{"text": "%s", "alt": "%s", "class": "%s" }' \
           "$text" "" "$class"
    exit 0
}

function main() {
    if ! mako_running; then
        waybar_return_err "mako is not running"
    fi
    waybar_return
}
main
