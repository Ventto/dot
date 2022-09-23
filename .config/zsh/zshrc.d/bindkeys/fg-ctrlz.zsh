fg-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then BUFFER="fg"; zle accept-line;
	else zle push-input; zle clear-screen; fi
}
zle -N fg-ctrl-z
bindkey '^Z' fg-ctrl-z
