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

PrintJson () {
    cat "$1" | jq
}
