#!/bin/sh

CDIR="$(dirname "$0")"
ACTION_DIR="${CDIR}/actions"

MINUTE=60
LOCK_TIMEOUT=$((10 * MINUTE))
MONITOR_OFF_TIMEOUT=$((LOCK_TIMEOUT + 2 * MINUTE))
SUSPEND_TIMEOUT=$((MONITOR_OFF_TIMEOUT + 3 * MINUTE))

check_conf_val() {
    if ! echo "$1" | grep -E '^[1-9][0-9]*[smh]$' >/dev/null 2>&1; then
        return 1
    fi
    duration="$(echo "$1" | sed -n 's/\(.*\)[smh]$/\1/p')"
    duration_type="$(echo "$1" | sed -n 's/.*\([smh]\)$/\1/p')"
    case $duration_type in
        s) seconds="$duration";;
        m) seconds=$((duration * 60));;
        h) seconds=$((duration * 60 * 60 ));;
    esac
    echo "$seconds"
}

load_conf() {
    key="$1"
    val="$2"
    case "$key" in
        LockActionTimeout)
            res="$(check_conf_val "$val")"
            [ "$?" -ne 0 ] && return 1
            LOCK_TIMEOUT="$res"
            ;;
        MonitorOffActionTimeout)
            res="$(check_conf_val "$val")"
            [ "$?" -ne 0 ] && return 1
            MONITOR_OFF_TIMEOUT="$res"
            ;;
        SuspendActionTimeout)
            res="$(check_conf_val "$val")"
            [ "$?" -ne 0 ] && return 1
            SUSPEND_TIMEOUT="$res"
            ;;
        *) return 1;;
    esac
}

load_conf_file() {
    if ! test -f "${CDIR}/idle.conf"; then
        echo "${CDIR}/idle.conf: cannot read configuration file"
        return 1
    fi
    for line in $(cat "${CDIR}/idle.conf"); do
        key=$(echo "$line" | cut -d= -f1)
        val=$(echo "$line" | cut -d= -f2)
        if ! load_conf "$key" "$val"; then
            echo "${CDIR}/idle.conf: invalid configuration value"
            return 1
        fi
    done
}

main() {
    if ! load_conf_file; then
        exit 1
    fi

    echo "${LOCK_TIMEOUT} ${MONITOR_OFF_TIMEOUT} ${SUSPEND_TIMEOUT}"

    swayidle -w \
        timeout "$LOCK_TIMEOUT" "${ACTION_DIR}/lock.sh" \
        timeout "$MONITOR_OFF_TIMEOUT" "${ACTION_DIR}/monitor-off.sh" \
            resume "swaymsg 'output * dpms on'" \
        before-sleep "${ACTION_DIR}/lock.sh" \
        timeout "$SUSPEND_TIMEOUT" "${ACTION_DIR}/suspend.sh"
}

main
