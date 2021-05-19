#!/bin/sh

CDIR=$(dirname "$0")
INHIBITORS_DIR="${CDIR}/../inhibitors"

. "${CDIR}/../common/log.sh"

# This script is used as shortcut to lock screen manually.
if [ "$#" -ne 1 ] && [ "$1" != "--force" ]; then
    if "${INHIBITORS_DIR}/inhibitors.sh"; then
        exit 1
    fi
fi

log "Locking..."
swaylock -e -F -f -n -c 000000 -i "${HOME}/images/wallpapers/matin.png"
