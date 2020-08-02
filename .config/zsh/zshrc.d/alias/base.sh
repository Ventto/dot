#!/bin/sh

alias l='ls -1'
alias ll='ls -lhF'
alias la='ls -lhAF'
alias ld='ls -ld *'
alias lad='ls -lAd .* | grep --color=never "^d"'
alias laf='ls -lAd .* | grep --color=never -v "^d"'

alias bb='popd > /dev/null'
alias b='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias tmp="cd $(mktemp -d)"
alias klog="journalctl --dmesg -o short -f"

alias e="$EDITOR -p"
alias calc="bc -l"
alias grep='grep --color=auto'
