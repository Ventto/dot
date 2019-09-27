#!/bin/zsh

alias reload=". $ZDOTDIR/.zshrc"

#==============================#
#           Patches            #
#==============================#

# Open a new terminal from current directory
if [[ $TERM == xterm-termite && $- == *i* ]]; then
    if ! . "/etc/profile.d/vte.sh" > /dev/null 2>&1; then
        if ! . "/usr/local/etc/profile.d/vte.sh" > /dev/null 2>&1; then
            echo "Error: feature/open a new terminal from current directory"
            echo "Error: cannot find 'vte.sh'"
        else
            __vte_osc7
        fi
    else
        __vte_osc7
    fi
fi

# Fix slow git autocompletion in huge repositories
__git_files () {
    _wanted files expl 'local files' _files
}

#==============================#
#           Options            #
#==============================#

# History

HISTFILE=~/.cache/zsh_hist
HISTSIZE=1000000
SAVEHIST=1000000

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Directory

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
setopt RM_STAR_WAIT
setopt NOGLOBDOTS
setopt AUTO_CD
REPORTTIME=5

#==============================#
#           Prompt             #
#==============================#

setopt prompt_subst
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' get-revision true
zstyle ':vcs_info:git*' formats " %r/%S %F{green} -(%b)%u%f"
zstyle ':vcs_info:git*' actionformats " %r/%S %F{green} -(%b|%a)%u%f"

PROMPT=$'%{$bg[red]%}[%D{%H:%M:%S}]${cpwd}${vcs_info_msg_0_}${icon} # %{$reset_color%} '

is_precmd=false

function precmd {
    [ "$?" -eq 0 ] && icon="" || icon=""
    vcs_info
    [ -z "${vcs_info_msg_0_}" ] && cpwd=$' %~ ' || cpwd=$''
    if [ -n "$WINDOW_TITLE" ]; then
        print -Pn "\e]0;${WINDOW_TITLE}\a"
    else
        ! $is_precmd && print -Pn "\e]0;Shell\a"
        is_precmd=true
    fi
}

function set_window_title () {
    export WINDOW_TITLE="$1"
}

# Print command line in window title
function preexec () {
    if [ -z "$WINDOW_TITLE" ] && $is_precmd; then
        if [ "$(echo "$1" | wc -c)" -gt 32 ]; then
            cmdline="$(echo -n "$1" | cut -c1-32; echo "...")"
        else
            cmdline="$1"
        fi
        print -Pn "\e]0;Shell: ${cmdline} \a"
    fi
}

#==============================#
#    Environment Variables     #
#==============================#

export BROWSER="firefox --profile '${HOME}/.config/firefox/default'"
export EDITOR="nvim -p"
export SUDO_EDITOR="rnano"
export TERMINAL="termite"
export USE_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIMP2_DIRECTORY=".config/gimp"
export LANG=en_US.UTF-8
export GOPATH="$HOME/.config/go"
export PATH="/usr/local/bin:${HOME}/.local/bin:${PATH}"
export PATH="/opt/xtools/arm-unknown-eabi/bin:${PATH}"
export ANDROID_HOME="/opt/android-sdk"
export LESSHISTFILE=/dev/null

#==============================#
#           Sourcing           #
#==============================#

# Source functions, aliases, completion and binkeys zsh files, elegantly...
source "${ZDOTDIR}/zshrc.d/helper.zsh"

# Caution: Always source functions first (ex: aliases could require functions)
add_functions 'file'
add_functions 'xenv'
add_functions 'manpage'
add_functions 'maths'

add_aliases 'base'
add_aliases 'security'
add_aliases 'aur'
add_aliases 'dev'

add_comp 'base'

# Completion (bash)
autoload -U +X bashcompinit && bashcompinit
add_bash_comp 'ct-ng'

add_bindkeys 'base'
add_bindkeys 'edit-command-line'
add_bindkeys 'fg-ctrlz'
