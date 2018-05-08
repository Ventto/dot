#!/bin/zsh

#==============================#
#           History            #
#==============================#

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

#==============================#
#           Options            #
#==============================#

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
zstyle ':vcs_info:git*' formats " %r/%S %F{green} -(%b)%f%F{red}%u%f"
zstyle ':vcs_info:git*' actionformats " %r/%S %F{green} -(%b|%a)%u%f"

PROMPT=$'%{$bg[red]%}[%D{%M:%S}]${cpwd}${vcs_info_msg_0_}${icon} # %{$reset_color%} '

function precmd {
    [ "$?" -eq 0 ] && icon="" || icon=""
    vcs_info
    [ -z "${vcs_info_msg_0_}" ] && cpwd=$' %~ ' || cpwd=$''
}

# Print command line in window title
function preexec () {
    print -Pn "\e]0;$1\a"
}

#==============================#
#    Environment Variables     #
#==============================#

export BROWSER="firefox"
export EDITOR="nvim -p"
export USE_EDITOR="nvim -p"
export VISUAL="nvim -p"
export GIMP2_DIRECTORY=".config/gimp"
export LANG=en_US.UTF8
export GOPATH="$HOME/.config/go"
export PATH="/usr/local/bin:${HOME}/.local/bin:${PATH}"
export PATH="/opt/xtools/arm-unknown-eabi/bin:${PATH}"
export ANDROID_HOME="/opt/android-sdk"
export LESSHISTFILE=/dev/null

#==============================#
#  Alias/Function/Completion   #
#==============================#

# Source functions, aliases, completion and binkeys zsh files elegantly
source "${ZDOTDIR}/zshrc.d/helper.zsh"

# Caution: Always source functions first (ex: aliases could require functions)
add_functions 'file'
add_functions 'manpage'
add_functions 'maths'
add_functions 'nohup'

add_aliases 'base'
add_aliases 'aur'

add_comp 'base'

# Completion (bash)
autoload -U +X bashcompinit && bashcompinit
add_bash_comp 'ct-ng'

# Bindkeys
add_bindkeys 'base'
add_bindkeys 'edit-command-line'
add_bindkeys 'fg-ctrlz'
