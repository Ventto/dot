i3bar_conky_print_config() {
    local _filepath="$1"; shift
    if [ ! -f "$_filepath" ] || [ ! -r "$_filepath" ]; then
        echo "${_filepath}: file not found" >2
        exit 2
    fi
    conky -i 1 -c "$_filepath" | sed -e 's/],$/]/' | jq ''
}

# Display an i3's layout in a specific workspace
#
# $1    the basename of the layout JSON file located into
#       the `${HOME}/.config/i3/layout/` directory.
# $2    (optional) the workspace number where you want to display
#       the layout.
i3_layout()
{
    if [ "$#" -lt 1 ] || [ "$#" -gt 2 ] ; then
        echo "Usage: i3_layout LAYOUT [WORKSPACE]"
        return 2
    fi

    if [ "$#" -eq 2 ]; then
        if ! echo "$2" | grep -E "^[0-9]$" >/dev/null 2>&1; then
            echo "workspace option must an integer [0-9]."
            return 2
        fi

        # Extract workspace names
        ws_vars=$(sed -n 's%^set .\(ws[0-9]\+\) \(".*"\)%\1=\2%p' \
                      "${HOME}/.config/i3/config")

        [ -z "$ws_vars" ] && count=0 || count=$(($(echo "$ws_vars" | wc -l) - 1))

        if [ "${2}" -lt 0 ] || [ "$2" -gt "$count" ]; then
            echo "ws${2}: workspace not found"
            return 1
        fi

        workspace="workspace $(eval "$ws_vars; echo \"\$ws${2}\"");"
    fi

    filepath="${HOME}/.config/i3/layout/${1}.json"

    if [ ! -f "$filepath" ] || [ ! -r "$filepath" ]; then
        echo "$1: layout not found"
        return 1
    fi

    i3-msg "${workspace} append_layout ${filepath}"
}
