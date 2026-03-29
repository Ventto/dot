alias gocam='cd ~/Workspace/camera'
alias linux-flasher='sudo ~/Workspace/embedded-tools/Linux/flasher/flasher'
alias hid2adb='linux-flasher -forceadbmode'
alias exa='eza --oneline --color=always --group-directories-first --icons'
alias l='eza'
alias ll='eza -l'
alias ld='eza -la --only-dirs'
alias la='eza -la'
alias lt='eza -T' # tree listing
alias x=ixargs
alias watch=viddy
# You might need to run `tldr --update`
alias cheat='tldr -l | fzf --preview="tldr {} --color always" | xargs -r tldr'
alias colorizer='bat -pp -l log'
alias tmux-kill='tmux kill-session -t'
alias tmux-list='tmux list-sessions'
alias groot='cd "$(git rev-parse --show-toplevel)"'
