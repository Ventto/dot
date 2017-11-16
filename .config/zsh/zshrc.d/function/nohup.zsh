NoHup () {
    [ "$#" -ne 1 ] && return 1

    local _bin="${1}"; shift

    if ! alias "${_bin}"; then
        ! command -v "${_bin}" && return 2
        nohup "${_bin}" "${@}" > /dev/null 2>&1 &
        return 0
    fi
    unalias "${_bin}"
    nohup "${_bin}" "${@}" > /dev/null 2>&1 &
    alias "${_bin}='NoHup ${_bin} ${@}'"
}
