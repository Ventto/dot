#!/bin/sh

CDIR=$(dirname "$0")

. "${CDIR}/../common/log.sh"

log "Checking outputs..."
output="$(swaymsg -t get_outputs)"
count="$(echo "$output"| grep -c '"name":')"
if [ "$count" -ne 1 ]; then
    log "More than one output detected."
    exit 0
else
    log "Only one output detected "
    if echo "$output" | grep '"active": false' >/dev/null 2>&1; then
        log "The remaining output is off, trying to turn it on..."
        swaymsg "output * enable"
    else
        log "The remaining output is on."
    fi
fi
