NoHup () {
    [ "$#" -ne 1 ] && return 1

    local _cmd="${1}"; shift

    if [ -z "$(alias "${1}")" ]; then
        nohup "${_cmd}" "${@}" > /dev/null 2>&1 &
        return 0
    fi
    unalias "${_cmd}"
    nohup "${_cmd}" "${@}" > /dev/null 2>&1 &
    alias "${_cmd}='NoHup ${_cmd} ${@}'"
}
