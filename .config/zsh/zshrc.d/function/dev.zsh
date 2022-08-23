require_cmds \
    gitk \
    groff \
    gzip \
    help2man \
    less \
    nohup \
    tar

function man_read_mangz()
{
    if [ "$#" -ne 1 ] || [ ! -r "$1" ]; then return 1; fi

    local _file="$1"; shift

    if [ "${_file##*.}" = "gz" ]; then
        gzip -dc "${_file}" | groff -man -Tascii | less
    else
        groff -man -Tascii "${_file}" | less
    fi
}

function man_generate_and_read()
{
    if [ "$#" -ne 1 ] || [ ! -r "$1" ]; then return 1; fi

    local _file="$1"; shift

    help2man -N -n "Description" -h -h -v -v "${_file}" | \
        groff -man -Tascii | less
}

function tar_xz()
{
    local readonly _dir="$1"

    tar --xz -cvf "${_dir}.tar.xz" "$_dir"
}

function gitk_run()
{
    nohup gitk --max-count=100 $1 . >/dev/null 2>&1 &
}
