alias fd='fdfind --hidden'
alias gocam='cd ~/Workspace/camera'
alias linux-flasher='sudo ~/Workspace/embedded-tools/Linux/flasher/flasher'
alias hid2adb='linux-flasher -forceadbmode'
#alias rebase-i='git rebase -i $(git rev-parse --abbrev-ref --symbolic-full-name @{u})~1'

unalias cp
alias exa='exa --oneline --color=always --group-directories-first --icons'
alias l='exa -a'
alias ll='exa -l'
alias ld='exa -la --only-dirs'
alias la='exa -la'
alias lt='exa -Ta' # tree listing
alias x=ixargs
alias watch=viddy
# You might need to run `tldr --update`
alias cheat='tldr -l | fzf --preview="tldr {} --color always" | xargs -r tldr'
alias colorizer='bat -pp -l log'
alias tmux-kill='tmux kill-session -t'
alias tmux-list='tmux list-sessions'
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
