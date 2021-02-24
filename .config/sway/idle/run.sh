#!/bin/sh

CDIR="$(dirname "$0")"
ACTION_DIR="${CDIR}/actions"

MINUTE=60
LOCK_TIMEOUT=$((10 * MINUTE))
MONITOR_OFF_TIMEOUT=$((LOCK_TIMEOUT + 2 * MINUTE))
SUSPEND_TIMEOUT=$((MONITOR_OFF_TIMEOUT + 3 * MINUTE))

conf_val_to_secs() {
    # Print zero if fails
    if ! echo "$1" | grep -E '^[1-9][0-9]*[smh]$' >/dev/null 2>&1; then
        echo 0
        return
    fi
    duration="$(echo "$1" | sed -n 's/\(.*\)[smh]$/\1/p')"
    unit="$(echo "$1" | sed -n 's/.*\([smh]\)$/\1/p')"
    case $unit in
        s) seconds="$duration";;
        m) seconds=$((duration * 60));;
        h) seconds=$((duration * 60 * 60 ));;
    esac
    echo "$seconds"
}

conf_apply() {
    key="$1"
    val="$2"
    if [ -z "$key" ] || [ -z "$val" ]; then
        return 1
    fi
    case "$key" in
        LockActionTimeout)
            secs="$(conf_val_to_secs "$val")"
            [ "$secs" -eq 0 ] && return 1 || LOCK_TIMEOUT="$secs";;
        MonitorOffActionTimeout)
            secs="$(conf_val_to_secs "$val")"
            [ "$secs" -eq 0 ] && return 1 || MONITOR_OFF_TIMEOUT="$secs";;
        SuspendActionTimeout)
            secs="$(conf_val_to_secs "$val")"
            [ "$secs" -eq 0 ] && return 1 || SUSPEND_TIMEOUT="$secs";;
        *) return 1;;
    esac
}

conf_load_file() {
    if ! test -f "${CDIR}/idle.conf"; then
        echo "${CDIR}/idle.conf: cannot read configuration file"
        return 1
    fi
    # shellcheck disable=2013
    for line in $(cat "${CDIR}/idle.conf"); do
        key=$(echo "$line" | cut -d= -f1)
        val=$(echo "$line" | cut -d= -f2)
        if ! conf_apply "$key" "$val"; then
            echo "${CDIR}/idle.conf: invalid configuration value"
            return 1
        fi
    done
}

main() {
    if ! conf_load_file; then
        echo "It will use the default timeouts."
        exit 1
    fi

    echo "${LOCK_TIMEOUT} ${MONITOR_OFF_TIMEOUT} ${SUSPEND_TIMEOUT}"

    swayidle -w \
        timeout 3 "${ACTION_DIR}/turn-on-native-output.sh" \
        timeout "$LOCK_TIMEOUT" "${ACTION_DIR}/lock.sh" \
        timeout "$MONITOR_OFF_TIMEOUT" "${ACTION_DIR}/monitor-off.sh" \
            resume "swaymsg 'output * dpms on'" \
        before-sleep "${ACTION_DIR}/lock.sh --force" \
        timeout "$SUSPEND_TIMEOUT" "${ACTION_DIR}/suspend.sh"
}

main
