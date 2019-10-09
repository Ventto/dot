alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

#==============================#
#     Override binary name     #
#==============================#

# CLI Apps:
alias cal='cal --monday'
alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias dd='dd status=progress'
alias gdb='gdb -q'
alias less='LESSHISTFILE=- less -R -i'
alias ls='ls -bh -CF --color=always --hide="*~"'
alias sdiff='grep -vxf'
alias wget='wget --hsts-file /dev/null'
alias watch='watch -c '
alias scrot='scrot "$HOME/images/screenshots/%Y-%m-%d_%H:%M:%S.jpg" -q 90'

#==============================#
#       Super Shortcuts        #
#==============================#

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

# Clear clipboard
alias c='echo -n | xclip -display :0 -selection clipboard'
alias e="$EDITOR"
alias ro="nvim -p -R"    # editor in read-only mode

alias tmp="cd $(mktemp -d)"

alias clip='xclip -sel c < '

alias leak='valgrind --leak-check=full --show-leak-kinds=all'

#==============================#
#         Privileged           #
#==============================#

alias bluetooth-on='sudo systemctl start bluetooth.service'
alias bluetooth-off='sudo systemctl stop bluetooth.service'
alias wifi-on='sudo rfkill unblock wifi && sudo ip link set wlo0 up'
alias wifi-list='watch -c -n 1 nmcli -c yes device wifi list'
alias wifi-connect='nmtui-connect'

#==============================#
#          Features            #
#==============================#

alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias wanip='curl -s http://ip.tyk.nu/'
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"

alias pickcolor="grim -g \"\$(slurp -p)\" -t ppm - \
                    | convert - -format '%[pixel:p{0,0}]' txt:-"

# Allez-y M. Monet !
alias grep='grep --color=auto'
