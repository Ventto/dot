alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias lld='ls -ld */'
alias lad='ls -lAd .* | grep -E "^d"'
alias laf='ls -lAd .* | grep -v "^d"'
alias lls='ls -lhr --sort=size | grep -v "^d"'

alias ~='termite'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias b='popd 1>/dev/null'
alias cdvm="cd $HOME/vm/shared_dir"
alias dh='dirs -v'

alias blueon='sudo systemctl start bluetooth.service'
alias blueoff='sudo systemctl stop bluetooth.service'
alias du='ncdu '
alias findhard='find / -type f -iname'
alias findhere='find . -type f -iname'
alias grep='grep -E --color=auto'
alias i3log="DISPLAY=$DISPLAY i3-dump-log | less"
alias less='LESSHISTFILE=- less -R -i'
alias sdiff='grep -vxf'
alias ssk='ssh-add ~/.ssh/id_rsa'
alias vim='nvim -p'
alias vimup='nvim +PluginInstall +qall'
alias wget='wget --hsts-file /dev/null'

alias feh='NoHup feh'
alias gimp='NoHup gimp'
alias gitk='NoHup gitk --all'
alias nautilus='NoHup nautilus .'
alias smplayer='NoHup smplayer'
alias termite='NoHup termite'
alias texmaker='NoHup texmaker'
alias zathura='NoHup zathura'

alias dd='dcfldd'
alias mosd='sudo mount /dev/mmcblk0p1 /mnt/sd && { echo OK; cd /mnt/sd }'
alias umsd='sync && { sudo umount /mnt/sd && echo OK || echo FAILED; }'

alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias gdb='gdb -q'
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'

alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"
