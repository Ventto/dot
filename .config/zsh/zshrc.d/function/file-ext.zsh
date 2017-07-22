pretty_xml () {
    local  output="${1%%.*}-pretty.${1#*.}"
    xmllint --pretty 1 "${1}" > "${output}"
    mv "${output}" "${1}"
}
