if _require yay; then
pkgbuild() {
    if ! yay --noredownload --getpkgbuild "$1" >/dev/null 2>&1; then
        return $?
    fi
    local pth
    if [[ -n $XDG_CACHE_HOME ]]; then
        pth="$XDG_CACHE_HOME/yay/$1/PKGBUILD"
    else
        pth="$HOME/.cache/yay/$1/PKGBUILD"
    fi
    if [[ ! -f $pth ]]; then
        _err "$pth: PKGBUILD does not exist"
        return $?
    fi
    cat "$pth"
}
fi

if _require groff gzip; then
    function man_read()
    {
        if [ ! -r "$1" ]; then
            _err "$1: man page file not found"
        fi
        if [ "${1##*.}" = "gz" ]; then
            gzip -dc "${1}" | groff -man -Tascii | less
        else
            groff -man -Tascii "${1}" | less
        fi
    }
fi

if _require groff help2man less; then
    function man_create()
    {
        if [ ! -x "$1" ]; then
            _err "$1: executable not found";
        fi
        help2man -N -n "Description" -h -h -v -v "${1}"
    }
fi
