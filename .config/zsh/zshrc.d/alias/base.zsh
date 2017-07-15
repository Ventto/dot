#!/bin/sh

# Base
alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

# List files
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias ld='ls -ld *'
alias laf='ls -lAd .* | grep -v "^d"'
alias lls='ls -lhr --sort=size | grep -v "^d"'

# Directory stacks
alias dh='dirs -v'
alias ,,='cd -'
alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias .....='cd ../../../../..'
alias bb='popd 1>/dev/null'

# System infos
alias dmesg='dmesg -H -Lalways'
alias dmesgt='dmesg | tail -n20'
alias grep='grep -E --color=auto'
alias sdiff='grep -vxf'
alias du='ncdu '

# Basic app
alias vim='nvim'
alias vimup="vim +PluginInstall +qall"
alias i3up="~/.config/i3/contrib/i3up.sh"
alias i3log="DISPLAY=$DISPLAY i3-dump-log | less"

alias feh='NoHup feh -Timgviewer'
alias gimp='NoHup gimp'
alias nautilus='NoHup nautilus .'
alias smplayer='NoHup smplayer'
alias texmaker='NoHup texmaker'
alias termite='NoHup termite'
alias zathura='NoHup zathura'

alias dd='dcfldd '
alias mosd="sudo mount /dev/mmcblk0p1 /mnt/sd && { echo 'OK'; cd /mnt/sd } || echo 'FAILED'"
alias umsd="cd ~; sync; sudo umount /mnt/sd && echo 'OK' || echo 'FAILED'"

alias gdb="gdb -q -tui"
alias valgrind="valgrind --leak-check=full --show-leak-kinds=all --show-emwarns=yes "
alias checkpath="~/.bin/checkpatch.pl --no-tree --strict -show-types \
--ignore=FILE_PATH_CHANGES,BIT_MACRO -f"

alias cddl="cd ~/downloads/firefox"
alias cdvm="cd ~/vm/shared_dir"

# Bin
alias dropbox="~/.bin/dropbox "

# Pi
alias pissh="ssh tom@192.168.1.95"
alias piimg="sshfs tom@192.168.1.95:/mnt/hd/gdrive/Memories $SSHPI_PICTURES_DIR"
alias pimov="sshfs tom@192.168.1.95:/mnt/hd/Backup/Movies $SSHPI_VIDEOS_DIR"
alias pimsc="sshfs tom@192.168.1.95:/mnt/hd/gdrive/Media/Musics $SSHPI_MUSIC_DIR"
alias pidoc="sshfs tom@192.168.1.95:/mnt/hd/Backup/Documents $SSHPI_DOCUMENTS_DIR"
alias porn="pimov ; nohup smplayer -add-to-playlist $SSHPI_VIDEOS_DIR/porn &"
