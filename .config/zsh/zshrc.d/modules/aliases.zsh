# Basic
alias bb='popd > /dev/null'
alias b='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias l='eza'
alias ll='eza -l'
alias la='eza -la'
alias ld='eza -la --only-dirs'
alias lt='eza -T' # tree listing

# System
alias su="systemctl --user"
alias sus="systemctl --user list-unit-files --state=enabled"
alias s="systemctl"
alias ss="systemctl list-unit-files --state=enabled"
alias j="journalctl -e -u"
alias ju='journalctl --user -e -u'
alias jul='journalctl --user --follow -n 50 -u'
alias jk="journalctl --dmesg -o short"
alias jkl="journalctl --dmesg -o short -f -n 50"
alias dontsleep='systemd-inhibit'

# Overwrites
alias cal='cal --monday'
alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias cp=' rsync -auz --progress'
alias dd='dd status=progress'
alias gdb='gdb -q'
alias grep='grep --color=auto'
alias less='LESSHISTFILE=- less -R -i'
alias lsblk='lsblk -o NAME,PATH,MODEL,VENDOR,SIZE,FSAVAIL,FSUSE%,FSTYPE,MOUNTPOINT'
alias ssh='TERM=xterm ssh'
alias watch='watch -c '
alias wget='wget --hsts-file /dev/null'
alias top='btop'
alias fd='fd --no-ignore --exclude .git --hidden'

# Original
alias cheat='tldr -l | fzf --preview="tldr {} --color always" | xargs -r tldr' # You might need to run `tldr --update`
alias colorizer='bat -pp -l log'
alias calc="bc -l"
alias camera="run ffplay /dev/video0"
alias color="grim -g \"\$(slurp -p)\" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:-"
alias font-list="fc-list"
alias g="rg -i --hidden"
alias groot='cd "$(git rev-parse --show-toplevel)"'
alias getipv4="curl -4 icanhazip.com"
alias getipv6="curl -6 icanhazip.com"
alias getip="getipv4"
alias getphone="run scrcpy --turn-screen-off --disable-screensaver --window-width 480"
alias notrail="fd --type f --exec sed -i 's/[[:space:]]\+$//' {} \;"
alias rfirefox="firejail --private --nogroups --dns=9.9.9.9 firefox -no-remote -private-window"
alias tt="t2t --clipboard"
alias watch=viddy
alias wifiscan='viddy --disable_auto_save -n 1 nmcli -c yes -f SSID,BSSID,BARS,ACTIVE,CHAN,SECURITY dev wifi list'
alias x=ixargs
alias z='zed .'
