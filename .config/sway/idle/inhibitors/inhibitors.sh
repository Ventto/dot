#!/bin/sh

CDIR="$(dirname "$0")"

for inhibitor in $(cat "${CDIR}/inhibitors.conf"); do
    if ! test "${CDIR}/units/${inhibitor}.sh"; then
        continue
    else
        if "${CDIR}/units/${inhibitor}.sh"; then
            echo "Inhibitor \"${inhibitor}\" is active"
            exit 0
        else
            continue
        fi
    fi
done
exit 1
