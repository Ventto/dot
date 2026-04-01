### ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

### ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

### ctrl+backspace
bindkey '^H' backward-kill-word

### ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

alias w='just --justfile ${HOME}/.local/share/myjustfiles/justfile.windows --working-directory .'
alias pws='powershell.exe -ExecutionPolicy Bypass'
alias ws='cd /mnt/c/Users/thoma/Workspaces'
