i3bar_conky_print_config() {
    local _filepath="$1"; shift
    if [ ! -f "$_filepath" ] || [ ! -r "$_filepath" ]; then
        echo "${_filepath}: file not found" >2
        exit 2
    fi
    conky -i 1 -c "$_filepath" | sed -e 's/],$/]/' | jq ''
}
