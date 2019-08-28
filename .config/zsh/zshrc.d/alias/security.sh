# Run commands with firejail

alias hard-firefox='firejail --timeout=00:45:00 \
                             --private=$(mktemp -d) \
                             --nogroups --dns=8.8.8.8 \
                             --dns=8.8.4.4 \
                             --x11=xpra firefox --safe-mode \
                                                -no-remote \
                                                -private-window &'
alias hard-termite='firejail --timeout=00:05:00 termite &'
alias vlc='firejail vlc'
