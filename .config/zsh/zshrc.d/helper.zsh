#!/bin/zsh

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
