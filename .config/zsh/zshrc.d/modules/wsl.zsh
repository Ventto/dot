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

### backspace
# Many terminals send ^H or ^? for a plain Backspace key. Do not hijack
# those sequences for Ctrl+Backspace, or interactive TTY apps can receive
# an unexpected double deletion pattern.
bindkey '^H' backward-delete-char
bindkey '^?' backward-delete-char

### ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line

alias pws='powershell.exe -ExecutionPolicy Bypass'
