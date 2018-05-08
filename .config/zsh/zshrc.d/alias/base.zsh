alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

#==============================#
#     Override binary name     #
#==============================#

# CLI Apps:
alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias dd='dcfldd status=on'
alias gdb='gdb -q'
alias less='LESSHISTFILE=- less -R -i'
alias ls='ls -bh -CF --color=always'
alias sdiff='grep -vxf'
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'
alias wget='wget --hsts-file /dev/null'

# GUI Apps:
alias gimp='NoHup gimp'
alias gitk='NoHup gitk --all'
alias nautilus='NoHup nautilus .'
alias smplayer='NoHup smplayer'
alias termite='NoHup termite'
alias texmaker='NoHup texmaker'
alias zathura='NoHup zathura'

#==============================#
#       Super Shortcuts        #
#==============================#

alias ll='ls -lhF'
alias la='ls -lhAF'
alias ld='ls -ld *'
alias lad='ls -lAd .* | grep --color=never "^d"'
alias laf='ls -lAd .* | grep --color=never -v "^d"'

alias b='popd > /dev/null'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Clear clipboard
alias c='echo -n | xclip -display :0 -selection clipboard'
alias e="${EDUTOR}"
alias e.="${EDUTOR} ."

#==============================#
#         Privileged           #
#==============================#

alias blueon='sudo systemctl start bluetooth.service'
alias blueoff='sudo systemctl stop bluetooth.service'

#==============================#
#          Features            #
#==============================#

alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias wanip='curl -s http://ip.tyk.nu/'
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"

# Allez-y M. Monet !
alias grep='grep --color=auto'
