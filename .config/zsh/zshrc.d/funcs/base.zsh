#!/usr/bin/env zsh

if _require nohup; then
    function run () {
        nohup "$@" >/dev/null 2>&1 &
        disown
    }
fi

# `e` with no arguments opens the current directory in Vim, otherwise opens the
# given location
if _require nvim; then
    function e() {
        if [ $# -eq 0 ]; then
            nvim .
        else
            nvim -p "$@"
        fi
    }
fi

# `o` with no arguments opens the current directory, otherwise opens the given
# location
if _require xdg-open; then
    function o() {
        if [ $# -eq 0 ]; then
            run xdg-open .
        else
            run xdg-open "$@"
        fi
    }
fi

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@"
    cd "$@" || exit
}

# Make a temporary directory and enter it
if _require mktemp; then
    function tmpd() {
        local dir
        if [ $# -eq 0 ]; then
            dir=$(mktemp -d)
        else
            dir=$(mktemp -d -t "${1}.XXXXXXXXXX")
        fi
        cd "$dir" || exit
    }
fi

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
if _require tar; then
    function targz() {
        local readonly tmpFile="${1%/}.tar"
        tar -cvf "${tmpFile}" --exclude=".DS_Store" "${1}" || return 1

        size=$(
        stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
        stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
        )

        local cmd=""
        if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
            # the .tar file is smaller than 50 MB and Zopfli is available; use it
            cmd="zopfli"
        else
            if hash pigz 2> /dev/null; then
                cmd="pigz"
            else
                cmd="gzip"
            fi
        fi

        echo "Compressing .tar using \`${cmd}\`…"
        "${cmd}" -v "${tmpFile}" || return 1
        [ -f "${tmpFile}" ] && rm "${tmpFile}"
        echo "${tmpFile}.gz created successfully."
    }
fi

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local readonly arg=-sbh
    else
        local readonly arg=-sh
    fi
    # shell_check disable=SC2199
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg -- .[^.]* *
    fi
}

# Use Git’s colored diff when available
if _require git; then
    function diff() {
        git diff --no-index --color-words "$@"
    }
fi

# Create a data URL from a file
function dataurl() {
    local mimeType
    mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

if _require curl; then
# Create a git.io short URL
    function gitio() {
        if [ -z "${1}" ] || [ -z "${2}" ]; then
            echo "Usage: \`gitio slug url\`"
            return 1
        fi
        curl -i https://git.io/ -F "url=${2}" -F "code=${1}"
    }

# Print the weather of the given location otherwise from your current location
    function weather() {
        local loc
        loc="$(echo "$1" | tr ' ' '+')"
        curl -s "wttr.in/${loc}"
    }
fi

# Start an HTTP server from a directory, optionally specifying the port
if _require python2; then
    server() {
        local readonly port="${1:-8000}"
        sleep 1 && open "http://localhost:${port}/" &
        # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
        # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
        python2 -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
    }
fi

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
if _require python pygmentize; then
    json() {
        if [ -t 0 ]; then # argument
            python -mjson.tool <<< "$*" | pygmentize -l javascript
        else # pipe
            python -mjson.tool | pygmentize -l javascript
        fi
    }
fi

# Print process information based on name, ps(pgrep(name))
if _require pgrep; then
    p() {
        if [[ $# == 0 ]]; then
            return 1
        fi
        local readonly pid="$(pgrep -d, -x "$1")"
        if [[ -z $pid ]]; then
            return 1
        fi
        ps -fp "$pid"
    }
fi

if _require smem; then
    m() {
        smem -M "$1" -s pss --total --abbreviate
    }
fi

if _require bc tr; then
    function bin2dec () { echo "ibase=2; ${1}" | bc; }
    function dec2bin () { echo "obase=2; ${1}" | bc; }
    function dec2hex () { echo "obase=16; ${1}" | bc; }
    function hex2dec () { echo "ibase=16; $(echo "${1}" | tr '[a-z]' '[A-Z]')" | bc; }
fi

if _require rfkill systemctl ip; then
    function on() {
        case $1 in
            bluetooth)
                sudo rfkill unblock $1
                sudo systemctl restart bluetooth;;
            wifi)
                sudo rfkill unblock $1
                sudo ip link set wlo0 up;;
        esac
    }

    function off() {
        case $1 in
            bluetooth|wifi) sudo rfkill block $1;;
        esac
    }
fi

if _require tar xz; then
    function tarxz()
    {
        local _dir="$1"
        readonly _dir

        tar --xz -cvf "${_dir}.tar.xz" "$_dir"
    }
fi

if _require xargs; then
    function ixargs() {
        xargs -I{} zsh -ic "$@"
    }
fi

if _require inkscape; then
    function svg2pdf() {
        inkscape --export-type=pdf --export-filename="${1%.*}.pdf" "${1}"
    }
fi

function loop() {
    local count=$1
    shift
    if [[ $count =~ ^[0-9]+$ && $count -ge 0 ]]; then
        while [ $count -gt 0 ]; do
            eval "$@"
            count=$((count - 1))
            sleep 3
        done
    elif [[ $count == "forever" ]]; then
        while true; do
            eval "$@"
            sleep 3
        done
    else
        echo "Error: count is not a non-negative integer" >&2
        return 1
    fi
}

if _require ssh; then
    function autossh () {
        local opts=( -o ServerAliveInterval=2
                     -o ServerAliveCountMax=2
                     -o ConnectTimeout=1
                     -o UserKnownHostsFile=/dev/null
                     -o StrictHostKeyChecking=no )
        if (( $# == 0)); then
            echo "_autossh HOST CMD" >&2
            return 1
        fi
        local host="$1"
        local _ssh=( ssh "${opts[@]}" "$host")
        shift
        while true; do
            printf "[ host: %s ]\n\nConnecting..." "$host"
            while true; do
                if ${_ssh} echo; then
                    break
                fi
                sleep 2
                printf '.'
            done
            clear
            if (( $# >= 1)); then
                ${_ssh} $@
            fi
            # If there is no specific command  to run or the specific command
            # exits for any reason open a shell.
            ${_ssh}
            # Give us enough time to exit the loop with CTRL-C
            sleep 2
            clear
        done
    }
fi

function _wait_to_pass() {
    local timeout="$1"
    shift
    while ! eval "$@" && [[ $((timeout--)) > 0 ]]; do
        sleep 1
    done
}

function tmux-set-pane-title() {
    printf '\033]2;%s\033\\' "$1"
}

if _require bat fzf; then
    function c() {
        if [ $# -gt 0 ]; then
            bat "$@"
        else
            bat "$(fzf)"
        fi
    }
fi

if _require nvim fzf; then
    function e() {
        local editor=( nvim -p )

        readonly editor
        if [ "$#" -eq 0 ]; then
            ${editor} $(fzf -m)
        else
            ${editor} "$@"
        fi
    }
fi

if _require fd fzf; then
    function cdf() {
        if [ "$#" -eq 0 ]; then
            cd $(fd --type d | fzf)
        else
            cd "$@"
        fi
    }
fi
