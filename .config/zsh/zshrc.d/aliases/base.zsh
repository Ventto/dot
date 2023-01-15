alias ls='ls -bh -CF --color=always --hide="*~" --color -h --group-directories-first'
alias l='ls -1'
alias ll='ls -lhF'
alias la='ls -lhAF'
alias ld='ls -ld */'
alias lad='ls -lAd .*/'
alias laf='ls -lAd .* | grep --color=never -v "^d"'

alias bb='popd > /dev/null'
alias b='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

# Full option commands
alias cal='cal --monday'
alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias cp=' rsync -auz --progress'
alias dd='dd status=progress'
alias gdb='gdb -q'
alias grep='grep --color=auto'
alias less='LESSHISTFILE=- less -R -i'
alias lsblk='lsblk -o NAME,PATH,MODEL,VENDOR,SIZE,FSUSED,FSUSE%,TYPE,MOUNTPOINT'
alias ssh='TERM=xterm ssh'
alias watch='watch -c '
alias wget='wget --hsts-file /dev/null'

# Original basics
alias calc="bc -l"
alias camera="run ffplay /dev/video0"
alias color="grim -g \"\$(slurp -p)\" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:-"
alias font-list="fc-list"
alias getipv4="curl -4 icanhazip.com"
alias getipv6="curl -6 icanhazip.com"
alias i3log='DISPLAY=${DISPLAY} i3-dump-log | less'
alias mux='tmuxinator'
alias phone="run scrcpy --turn-screen-off --disable-screensaver --window-width 480"
alias wifiscan='watch -c -n 1 nmcli -c yes -f SSID,BSSID,BARS,ACTIVE,CHAN,SECURITY dev wifi list'
alias rfirefox="firejail --private --nogroups --timeout=00:45:00 \
                         --dns=8.8.8.8 \
                         --dns=8.8.4.4 \
                         firefox -no-remote -private-window"

if _systemd_running; then
    alias klog-live="journalctl --dmesg -o short -f -n 50"
    alias klog="journalctl --dmesg -o short"
    alias noidle='systemd-inhibit'
    alias systemd-unit-states='systemctl list-unit-files --user --state=enabled \
      && systemctl list-unit-files --system --state=enabled'
    alias systemd-news-about='journalctl --user --pager-end --follow -u'
    alias scs="systemctl --system"
    alias scu="systemctl --user"
else
    alias klog-live="sudo dmesg --human -w"
    alias klog="sudo dmesg"
fi

# Put in containers
alias yay='taskset -c 5 yay'
