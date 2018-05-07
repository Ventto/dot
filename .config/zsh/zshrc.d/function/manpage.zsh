vman() {
    if [ "$#" -ne 1 ] || [ ! -r "$1" ]; then return 1; fi

    local _file="$1"; shift

    if [ "${_file##*.}" = "gz" ]; then
        gzip -dc "${_file}" | groff -man -Tascii | less
    else
        groff -man -Tascii "${_file}" | less
    fi
}

xman() {
    if [ "$#" -ne 1 ] || [ ! -r "$1" ]; then return 1; fi

    local _file="$1"; shift

    help2man -N -n "Description" -h -h -v -v "${_file}" | \
        groff -man -Tascii | less
}
