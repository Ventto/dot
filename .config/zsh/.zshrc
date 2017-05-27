#!/bin/zsh

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

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

# Sources
. "${ZDOTDIR}/alias"
. "${ZDOTDIR}/completion"

# # Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

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

fg-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then BUFFER="fg"; zle accept-line;
	else zle push-input; zle clear-screen; fi
}
zle -N fg-ctrl-z
bindkey '^Z' fg-ctrl-z

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
