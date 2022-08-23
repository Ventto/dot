,unction _my_log()
{
    printf "zshrc log: %s(): %s\n" "${funcstack[2]}" "$1"
}

function _my_err()
{
    printf "zshrc error: %s(): %s\n" "${funcstack[2]}" "$1"
}

##
# require_cmds() - Verify command's executables exist
#
# $1: command names
#
# Return: 0 on success, else positive error code.
function require_cmds() {
    for cmd in "$@"; do
        if ! command -vp "$cmd" > /dev/null 2>&1; then
            _my_err "'${cmd}' command not found"
            return 127
        fi
    done
}

require_cmds xdg-user-dir

function _my_xdg_dir_subpath_exist()
{
    [ "$#" -eq 2 ] || return 2
    local xdg_type="$1"
    local subpath="$2"
    xdg_dir="$(xdg-user-dir "$xdg_type")"
    [ -d "$xdg_dir" ] || return 1
    [ -d "${xdg_dir}/${subpath}" ] || return 1
    echo "${xdg_dir}/${subpath}"
}

function killall_match() {
    pgrep -f "$1" | xargs kill -9
}

function run() {
    nohup $@ >/dev/null 2>&1 &
}
