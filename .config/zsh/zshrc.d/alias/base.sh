#!/bin/sh

alias ls='ls -bh -CF --color=always --hide="*~" --color -h --group-directories-first'
alias l='ls -1'
alias ll='ls -lhF'
alias la='ls -lhAF'
alias ld='ls -ld */'
alias lad='ls -lAd .*/'
alias laf='ls -lAd .* | grep --color=never -v "^d"'

alias less='LESSHISTFILE=- less -R -i'

alias bb='popd > /dev/null'
alias b='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

alias grep='grep --color=auto'
alias cp=' rsync -auz --progress'
