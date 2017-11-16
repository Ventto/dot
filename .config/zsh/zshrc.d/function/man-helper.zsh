vman() {
    file=$(basename "${1}")
    echo "$file"
    if [ "${file##*.}" = "gz" ]; then
        gzip -dc "${1}" | groff -man -Tascii | less
    else
        groff -man -Tascii "${1}" | less
    fi
}

xman() {
    help2man -N -n "Description" -h -h -v -v "${1}" | groff -man -Tascii | less
}
