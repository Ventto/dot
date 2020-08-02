#!/bin/sh

alias clear-clipboard='wl-copy < /dev/null'
alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias wanip='curl -s http://ip.tyk.nu/'
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"
alias pickcolor="grim -g \"\$(slurp -p)\" -t ppm - \
                    | convert - -format '%[pixel:p{0,0}]' txt:-"
alias dolphin-here="QT_QPA_PLATFORMTHEME=qt5ct nohup dolphin . >/dev/null 2>&1 &"
alias pdfviewer="okular"
alias imgviewer="nomacs"
alias imgeditor="gimp"
alias printer-config="system-config-printer"
alias VirtualBox="QT_QPA_PLATFORM=xcb VirtualBox"
alias virtualbox="QT_QPA_PLATFORM=xcb VirtualBox"
