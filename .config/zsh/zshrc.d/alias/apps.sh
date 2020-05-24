#!/bin/sh

alias clear-clipboard='wl-copy < /dev/null'
alias i3log="DISPLAY=${DISPLAY} i3-dump-log | less"
alias wanip='curl -s http://ip.tyk.nu/'
alias weather="curl -s wttr.in/Paris"
alias weather-now="curl -s wttr.in/Paris | sed -n '3,7p'"

alias pickcolor="grim -g \"\$(slurp -p)\" -t ppm - \
                    | convert - -format '%[pixel:p{0,0}]' txt:-"
alias dolphin-here="QT_QPA_PLATFORMTHEME=qt5ct nohup dolphin . >/dev/null 2>&1 &"
alias pdfviewer="QT_QPA_PLATFORMTHEME=qt5ct okular"
alias imgviewer="QT_QPA_PLATFORMTHEME=qt5ct nomacs"
