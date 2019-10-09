#!/bin/sh

DIM_TIMEOUT=60 # one minute
LOCK_TIMEOUT=$DIM_TIMEOUT+120
DPMS_TIMEOUT=$LOCK_TIMEOUT+60
SUSPEND_TIMEOUT=$DPMS_TIMEOUT+60

IDLE="${HOME}/.config/sway/idle"


swayidle -w \
    timeout "$DIM_TIMEOUT" "${IDLE}/backlight.sh low"
        resume "lux -S 30%" \
    timeout "$LOCK_TIMEOUT" "$IDLE/lock.sh" \
    timeout "$DPMS_TIMEOUT" "$IDLE/backlight.sh off" \
        resume "lux -S 30%" \
    timeout "$SUSPEND_TIMEOUT" "$IDLE/suspend.sh"
