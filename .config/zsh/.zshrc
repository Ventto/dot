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

# Sanity check for 'rm *'
setopt RM_STAR_WAIT

# Directory stack
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# Variables
export BROWSER="firefox"
export EDITOR="nvim"
export USE_EDITOR="nvim"
export VISUAL="nvim"
export GIMP2_DIRECTORY=".config/gimp"
export LANG=en_US.UTF8
export PATH="${HOME}/.local/bin:${PATH}"

# Plugins
if [ -d "${ZDOTDIR}/zshrc.d" ]; then
    # Functions
    if [ -d "${ZDOTDIR}/zshrc.d/function" ]; then
        for file in ${ZDOTDIR}/zshrc.d/function/*.zsh; do
            source $file
        done
    fi

    # Aliases
    if [ -d "${ZDOTDIR}/zshrc.d/alias" ]; then
        for file in ${ZDOTDIR}/zshrc.d/alias/*.zsh; do
            source $file
        done
    fi

    # Completion: zsh
    if [ -d "${ZDOTDIR}/zshrc.d/completion" ]; then
        for file in ${ZDOTDIR}/zshrc.d/completion/*.zsh; do
            source $file
        done
    fi
    # Completion: bash
    if [ -d "${ZDOTDIR}/zshrc.d/completion/bash" ]; then
        autoload bashcompinit
        bashcompinit
        for file in ${ZDOTDIR}/zshrc.d/completion/bash/*.zsh; do
            source $file
        done
    fi
fi

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

if [ -d "${ZDOTDIR}/zshrc.d/bindkey" ]; then
    for file in ${ZDOTDIR}/zshrc.d/bindkey/*.zsh; do
        source $file
    done
fi

# Prompt
setopt prompt_subst
autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' get-revision true
zstyle ':vcs_info:git*' formats " %r/%S %F{green} -(%b)%f%F{red}%u%f"
zstyle ':vcs_info:git*' actionformats " %r/%S %F{green} -(%b|%a)%u%f"

p_pwd=$' %~ '
PROMPT=$'%{$bg[red]%}[%D{%M:%S}]${p_pwd}${vcs_info_msg_0_}${success_icon} # %{$reset_color%} '

function precmd {
	[ "$?" -eq 0 ] && success_icon="" || success_icon=""
	vcs_info
	[ -z "${vcs_info_msg_0_}" ] && p_pwd=$' %~ ' || p_pwd=$''
}
