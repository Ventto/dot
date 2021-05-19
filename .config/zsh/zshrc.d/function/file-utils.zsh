#!/bin/zsh

function pdf_merge()
{
    local _output_file="$1"; shift

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$_output_file" "$@"
}

function json_prettyprint()
{
    local _filepath="$1"

    cat "$_filepath" | python -m json.tool
}
