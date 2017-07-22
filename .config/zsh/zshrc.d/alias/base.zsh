alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"
alias ssk='ssh-add ~/.ssh/id_rsa'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ld='ls -ld *'
alias laf='ls -lAd .* | grep -v "^d"'
alias lls='ls -lhr --sort=size | grep -v "^d"'

alias dh='dirs -v'
alias ,,='cd -'
alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'
alias bb='popd 1>/dev/null'
alias cdvm="cd $HOME/vm/shared_dir"

alias grep='grep -E --color=auto'
alias sdiff='grep -vxf'
alias du='ncdu '

alias vim='nvim'
alias vimup='vim +PluginInstall +qall'
alias i3up="$HOME/.config/i3/contrib/i3up.sh"
alias i3log="DISPLAY=$DISPLAY i3-dump-log | less"

alias feh='NoHup feh -Timgviewer'
alias gimp='NoHup gimp'
alias nautilus='NoHup nautilus .'
alias smplayer='NoHup smplayer'
alias texmaker='NoHup texmaker'
alias termite='NoHup termite'
alias zathura='NoHup zathura'

alias dd='dcfldd'
alias mosd='sudo mount /dev/mmcblk0p1 /mnt/sd && { echo OK; cd /mnt/sd }'
alias umsd='sync && { sudo umount /mnt/sd && echo OK || echo FAILED; }'

alias gdb='gdb -q'
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all'
alias checkpatch='checkpatch.pl --no-tree --strict -f'

alias pdfmerge='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf '
alias prettyjson='python -m json.tool '
