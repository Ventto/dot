NoHup () {
    [ "$#" -lt 1 ] && return 1

    local _bin="${1}"; shift

    unalias "${_bin}"
    ! command -v "${_bin}" && return 2
    echo "nohup ${_bin} ${@} > /dev/null 2>&1 &"
    nohup "${_bin}" "${@}" > /dev/null 2>&1 &
    alias "${_bin}=NoHup ${_bin} ${@}"
}
