#!/bin/sh

INHIBITORS_DIR="$(dirname "$0")/../inhibitors"
if "${INHIBITORS_DIR}/inhibitors.sh"; then
    exit 1
fi

echo "Turning monitor off..."
swaymsg 'output * dpms off'
