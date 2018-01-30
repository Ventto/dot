add_file () {
    dir="${ZDOTDIR}/zshrc.d/$1"
    [ ! -d "$dir" ]  && { echo "[zsh] $dir: directory not found."; return 1; }
    file="$dir/$3.$2"
    [ ! -r "$file" ] && { echo "[zsh] $file: file not found."; return 1; }
    source "$file"
}

add_functions () { add_file 'function' 'zsh' "$1"; }
add_aliases () { add_file 'alias' 'zsh' "$1"; }
add_bindkeys () { add_file 'bindkey' 'zsh' "$1"; }
add_comp () { add_file 'completion' 'comp' "$1"; }
add_bash_comp () { add_file 'completion/bash' 'comp' "$1"; }
