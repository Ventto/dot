#!/bin/sh

INHIBITORS_DIR="$(dirname "$0")/../inhibitors"
if "${INHIBITORS_DIR}/inhibitors.sh"; then
    exit 1
fi

echo "Suspending..."
systemctl suspend
