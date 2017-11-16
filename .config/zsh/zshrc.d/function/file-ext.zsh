xml_show () {
    local output="${1%%.*}-pretty.${1#*.}"

    xmllint --pretty 1 "$1" > "${output}"
    mv "${output}" "$1"
}

pdf_merge () {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf "$@"
}

json_show () {
    python -m json.tool
}
