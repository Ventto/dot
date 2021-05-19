#!/bin/sh

CDIR=$(dirname "$0")
INHIBITORS_DIR="${CDIR}/../inhibitors"

. "${CDIR}/../common/log.sh"

if "${INHIBITORS_DIR}/inhibitors.sh"; then
    exit 1
fi

log "Turning monitor off..."
swaymsg 'output * dpms off'
