#!/bin/zsh

# History
HISTFILE=~/.histfile
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

# Security
setopt RM_STAR_WAIT

# Directory Stack
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Environment Variables
export BROWSER="firefox"
export EDITOR="nvim"
export USE_EDITOR="nvim"
export VISUAL="nvim"
export GIMP2_DIRECTORY=".config/gimp"
export LANG=en_US.UTF8
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/opt/xtools/arm-unknown-eabi/bin:${PATH}"

source "${ZDOTDIR}/zshrc.d/helper.zsh"

# Functions
add_functions 'file-ext'
add_functions 'man-helper'
add_functions 'maths'
add_functions 'nohup'

# Aliases
add_aliases 'base'
add_aliases 'pi'
add_aliases 'aur'

# Completion
add_comp 'base'
autoload -U +X bashcompinit && bashcompinit
add_bash_comp 'ct-ng'

# Bindkeys
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^d' delete-char
bindkey '^p' expand-or-complete-prefix
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '\e[3~' delete-char
bindkey '^[[3~' delete-char

add_bindkeys 'edit-command-line'
add_bindkeys 'fg-ctrlz'

# Prompt
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
