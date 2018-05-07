alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

#==============================#
#     Override binary name     #
#==============================#

# Command Line

alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias dd='dcfldd'
alias gdb='gdb -q'
alias grep='grep -E --color=auto'
alias less='LESSHISTFILE=- less -R -i'
alias ls='ls --color=auto'
alias sdiff='grep -vxf'
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'
alias vim='nvim -p'
alias wget='wget --hsts-file /dev/null'

# Graphic Interface

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

alias ll='ls -l'
alias la='ls -la'
alias lld='ls -ld */'
alias lad='ls -lAd .* | grep -E "^d"'
alias laf='ls -lAd .* | grep -v "^d"'
alias lls='ls -lhr --sort=size | grep -v "^d"'

# Clear clipboard
alias c='echo -n | xclip -display :0 -selection clipboard'
alias b='popd > /dev/null'
# Show directory stack history
alias ds='dirs -v'
alias e='nvim -p'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

#==============================#
#         Privileged           #
#==============================#

alias blueon='sudo systemctl start bluetooth.service'
alias blueoff='sudo systemctl stop bluetooth.service'

#==============================#
#          Features            #
#==============================#

alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"
