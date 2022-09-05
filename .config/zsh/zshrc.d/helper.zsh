#!/bin/zsh

function _zsh_log()
{
    printf "zshrc log: %s(): %s\n" "${funcstack[2]}" "$1"
}

function _zsh_err()
{
    printf "zshrc error: %s(): %s\n" "${funcstack[2]}" "$1"
}

##
# _check() - Verify command's executables exist
#
# $1: command names
#
# Return: 0 on success, else positive error code.
function check() {
    for cmd in "$@"; do
        if ! command -vp "$cmd" > /dev/null 2>&1; then
            _zsh_err "'${cmd}' command not found"
            return 127
        fi
    done
}

function add_file() {
    dir="${ZDOTDIR}/zshrc.d/$1"
    [ ! -d "$dir" ]  && { echo "[zsh] $dir: directory not found."; return 1; }
    file="$dir/$3.$2"
    [ ! -r "$file" ] && { echo "[zsh] $file: file not found."; return 1; }
    source "$file"
}

function add_functions() { add_file 'function' 'zsh' "$1"; }
function add_aliases() { add_file 'alias' 'sh' "$1"; }
function add_bindkeys() { add_file 'bindkey' 'zsh' "$1"; }
function add_comp() { add_file 'completion' 'zsh' "$1"; }
function add_bash_comp() { add_file 'completion/bash' 'sh' "$1"; }
function add_plugin() { add_file 'plugins' 'zsh' "$1"; }
