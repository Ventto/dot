#!/bin/zsh

PrettyXML () {
    local  output="${1%%.*}-pretty.${1#*.}"
    xmllint --pretty 1 "${1}" > "${output}"
    mv "${output}" "${1}"
}

MergePDF () {
    [ "$#" -lt "2" ] && { echo "Missing arguments."; return 1; }
    for last; do true; done
    array=( "$@" )
    unset "array[$#]"
    echo "pdftk ${array[@]} cat output ${last}"
}

alias pdfmerge='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf '
alias prettyjson='python -m json.tool '
alias prettyxml='PrettyXML '
