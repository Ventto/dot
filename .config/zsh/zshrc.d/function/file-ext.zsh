xml_show () {
    if [ "$#" -ne 1 ] || [ ! -r "$1" ]; then return 1; fi

    local _file="$1"; shift
    local output="${1%%.*}-pretty.${1#*.}"

    xmllint --pretty 1 "${_file}" > "${output}"
    mv "${output}" "${_file}"
}

pdf_merge () {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf "$@"
}

json_show () {
    python -m json.tool "$1"
}
