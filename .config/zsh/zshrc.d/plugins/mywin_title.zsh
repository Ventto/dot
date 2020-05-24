#!/bin/zsh

function _mywin_title_set() {
    export MYWIN_TITLE="$1"
}

function _mywin_title_precmd() {
    if [ -n "$MYWIN_TITLE" ]; then
        print -Pn "\e]0;${MYWIN_TITLE}\a"
    fi
}

function _mywin_title_preexec() {
    if [ -z "$MYWIN_TITLE" ]; then
        if [ "$(echo "$1" | wc -c)" -gt 32 ]; then
            cmdline="$(echo -n "$1" | cut -c1-32; echo "...")"
        else
            cmdline="$1"
        fi
        print -Pn "\e]0;Shell: ${cmdline} \a"
    fi
}

precmd_functions=($precmd_functions _mywin_title_precmd)
preexec_functions=($preexec_functions _mywin_title_preexec)
