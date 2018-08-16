#==============================#
#        PDF Processing        #
#==============================#

# Usage: PDFMerge [FILES...]
PDFMerge() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf "$@"
}

#==============================#
#       Pretty Printers        #
#==============================#

JSON_PrettyPrint () {
    cat "$1" | python -m json.tool
}
