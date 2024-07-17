function _log()
{
    local readonly msg="$1"

    printf "%s: %s\n" "${funcstack[3]}" "$msg"
}

function _err()
{
    _log "$@" >&2
}

# Checks the given command is an existing plain executable
function _require() {
    local cmd

    for cmd in "$@"; do
        if ! hash "$cmd" > /dev/null 2>&1; then
            _err "'${cmd}' command not found"
            return 1
        fi
    done
}

function _systemd_running() {
    ps --no-headers -o comm 1 | grep systemd >/dev/null 2>&1
}

function _tmux_send_keys_all_panes () {
    local session="$1"
    shift
    local win
    local pane
    for win in $(tmux list-windows -t "$session" -F '#W'); do
        for pane in $(tmux list-panes -t "${session}:${win}" -F '#P'); do
            echo tmux send-keys -t "${session}:${win}.${pane}" "$@"
            tmux send-keys -t "${session}:${win}.${pane}" "$@"
        done
    done
}
