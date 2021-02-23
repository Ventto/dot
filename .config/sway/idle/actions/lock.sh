#!/bin/sh

INHIBITORS_DIR="$(dirname "$0")/../inhibitors"
# This script is used as shortcut to lock screen manually.
if [ "$#" -ne 1 ] && [ "$1" != "--force" ]; then
    if "${INHIBITORS_DIR}/inhibitors.sh"; then
        exit 1
    fi
fi

echo "Locking..."
swaylock -e -F -f -n -c 000000 \
         -i "${HOME}/images/wallpapers/matin.png"
