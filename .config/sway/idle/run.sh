#!/bin/sh

MINUTE=60
LOCK_TIMEOUT=$((10 * MINUTE))
SCREEN_OFF_TIMEOUT=$((LOCK_TIMEOUT + 2 * MINUTE))
SUSPEND_TIMEOUT=$((SCREEN_OFF_TIMEOUT + 3 * MINUTE))

IDLE="${HOME}/.config/sway/idle"


set -x

swayidle -w \
    timeout "$LOCK_TIMEOUT" "$IDLE/lock.sh" \
    timeout "$SCREEN_OFF_TIMEOUT" "$IDLE/screenoff.sh" \
        resume "swaymsg 'output * enable'" \
    timeout "$SUSPEND_TIMEOUT" "$IDLE/suspend.sh" \
