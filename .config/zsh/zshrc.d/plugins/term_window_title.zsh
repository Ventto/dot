# Set the title of the current terminal's graphical window
function _term_window_title_set() {
    export _term_win_title="$1"
}

function _term_window_title_precmd() {
    if [ -n "$_term_win_title" ]; then
        print -Pn "\e]0;${_term_win_title}\a"
    fi
}

function _term_window_title_preexec() {
    if [ -z "$_term_win_title" ]; then
        print -Pn "\e]0;Shell\a"
    fi
}

alias title="_term_window_title_set"

precmd_functions=($precmd_functions _term_window_title_precmd)
preexec_functions=($preexec_functions _term_window_title_preexec)
