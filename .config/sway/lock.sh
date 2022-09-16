#!/usr/bin/env bash

# shellcheck disable=SC1091
. "${XDG_CONFIG_HOME}/sway/colors/starcitizen.sh"

swaylock --ignore-empty-password \
    --daemonize \
    --show-failed-attempts \
    --image "${XDG_CONFIG_HOME}/sway/wallpapers/current.jpg" \
    --scaling fill \
    --font "$THEME_FONT" \
    --font-size $((THEME_FONT_SIZE*3)) \
    --text-color "$THEME_FG" \
    --indicator-radius 256 \
    --indicator-thickness 12 \
    --color "$THEME_BG" \
    --separator-color "$THEME_BG_ALT" \
    --ring-color "$THEME_INACTIVE" \
    --inside-color "$THEME_BG_ALT" \
    --line-color "$THEME_BG" \
    --text-caps-lock-color "$THEME_WARNING" \
    --inside-caps-lock-color "$THEME_BG_ALT" \
    --ring-caps-lock-color "$THEME_WARNING" \
    --text-clear-color "$THEME_FG" \
    --inside-clear-color "$THEME_WARNING" \
    --ring-clear-color "$THEME_WARNING" \
    --text-ver-color "$THEME_FG" \
    --inside-ver-color "$THEME_BG_ALT" \
    --ring-ver-color "$THEME_ACTIVE" \
    --text-wrong-color "$THEME_FG" \
    --inside-wrong-color "$THEME_URGENT" \
    --ring-wrong-color "$THEME_URGENT" \
    --key-hl-color "$THEME_ACTIVE" \
    --bs-hl-color "$THEME_WARNING"
