function _log()
{
    local msg="$1"

    printf "zshrc: Log from %s(): %s\n" "${funcstack[2]}" "$msg"
}

function _err()
{
    local msg="$1"
    local errcode="$2"

    printf "zshrc: Error from %s(): %s\n" "${funcstack[2]}" "$msg" >&2
    return "$errcode"
}

# Checks the given command is an existing plain executable
function _require() {
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
