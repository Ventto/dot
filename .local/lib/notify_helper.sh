#!/bin/bash

notify_print_bar()
{
    for i in $(seq "$2"); do printf '%s' "$1"; done
}

notify_percent_to_bar()
{
    if [ "$#" -ne 1 ] || ! echo "$1" | grep -E '^[0-9]+$' >/dev/null 2>&1; then
        echo ""
        return 1
    fi

    _percent="$1"

    level="$((_percent / 10))"
    bar="$(notify_print_bar "  " "$level")"
    barempty=$(notify_print_bar "  " $((10 - level)))

    echo "${bar}${barempty}"
}

notify_dismiss_all()
{
    if ps -e | grep -E ' mako$' >/dev/null 2>&1; then
        makoctl dismiss --all && return 0
    fi
    if ps -e | grep -E ' dunst$' >/dev/null 2>&1; then
        dunst dismiss --all && return 0
    fi
    return 1
}

notify_get_icon()
{
    _icon_name="$1"

    icons_dir="/usr/lib/node_modules/material-design-icons/"
    icon_path="$(find "$icons_dir" -type f \
                      -name "ic_*${_icon_name}_black_48dp.png" | \
                 head -n1)"

    echo "$icon_path"
}

notify_error()
{
    _appname="$1"
    _msg="$2"

    notify_dismiss_all && \
        notify-send -a "error" \
                    -i "$(notify_get_icon "error")" \
                    "${_appname} : ${_msg}"
}
