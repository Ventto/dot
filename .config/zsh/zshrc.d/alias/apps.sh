#!/bin/sh

alias clear-clipboard='wl-copy < /dev/null'
alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias wanip='curl -s http://ip.tyk.nu/'
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"
alias pickcolor="grim -g \"\$(slurp -p)\" -t ppm - \
                    | convert - -format '%[pixel:p{0,0}]' txt:-"
alias dolphin="nohup dolphin . >/dev/null 2>&1 &"
alias pdfviewer="okular"
alias imgviewer="nomacs"
alias imgeditor="gimp"
alias mux='tmuxinator'
alias mycamera="ffplay /dev/video0"
alias myphone="scrcpy --turn-screen-off --disable-screensaver --window-width 480"
alias myprinters="system-config-printer"
alias nvim-install="nvim +PlugInstall"
alias nvim-update="nvim +PlugClean +PlugUpdate"
alias ssh="TERM=xterm ssh"
alias pdfmixtool='QT_QPA_PLATFORM=xcb pdfmixtool'
alias firefox='MOZ_ENABLE_WAYLAND=1 taskset -c 6,7 firefox -no-remote --profile "${HOME}/.config/firefox/"'
alias yay='taskset -c 5 yay'
alias cal='cal --monday'
alias calc="bc -l"
alias checkpatch='checkpatch.pl --no-tree --strict -f'
alias dd='dd status=progress'
alias gdb='gdb -q'
alias lsblk='lsblk -o NAME,PATH,MODEL,VENDOR,SIZE,FSUSED,FSUSE%,TYPE,MOUNTPOINT'
alias scrot='scrot "$HOME/images/screenshots/%Y-%m-%d_%H:%M:%S.jpg" -q 90'
alias sdiff='grep -vxf'
alias ssh='TERM=xterm ssh'
alias watch='watch -c '
alias wget='wget --hsts-file /dev/null'
