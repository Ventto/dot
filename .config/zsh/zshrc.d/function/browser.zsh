require_cmds fd

##
# browser_copy_to_downloads_dir()
#
# Copy sources into the browser's upload directory located at
# "XDG_DOWNLOAD_DIR/browser/uploads".
#
# Return: 0 on success, else positive error code.
#
function browser_copy_to_downloads_dir()
{
    if [ "$#" -eq 0 ]; then
        return 2
    fi
    dest="$(_my_xdg_dir_subpath_exist DOWNLOAD "browser/uploads")"
    ret="$?"
    if [ "$ret" -ne 0 ]; then
        echo "Error: something went wrong with xdg-user-dir command." >2
        return $ret
    fi
    cp -r $@ "$dest"
}

##
# browser_copy_lastscreenshots()
#
# $1: last n screenshots to copy
#
# Copy last screenshot recorded in the "XDG_PICTURES_DIR/images/screenshots"
# directory into the browser's upload directory located at
# "XDG_DOWNLOAD_DIR/browser/uploads".
#
# Return: 0 on success, else positive error code.
#
function browser_copy_lastscreenshots()
{
    if [ "$#" -ne 1 ]; then
        echo "Error: missing argument" >2
        return 2
    fi
    if [[ ! $1 =~ '[0-9]+' ]]; then
        echo "Error: bad argument" >2
        return 2
    fi
    local n_screenshot="$1"
    img_path="$(_my_xdg_dir_subpath_exist PICTURES "screenshots")"
    ret="$?"
    if [ "$ret" -ne 0 ]; then
        echo "Error: something went wrong with xdg-user-dir command." >2
        return $ret
    fi
    srcs=( $(fd --type f "." "$img_path" \
                --exec stat -c +"%Y %n" {} \; | \
                sort -n | tail -n${n_screenshot} | awk '{print $2}') )
    browser_copy_to_downloads_dir "${srcs[@]}"
}
alias c4b="browser_copy_to_downloads_dir"
alias s4b="browser_copy_lastscreenshots"
