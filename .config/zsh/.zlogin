#!/bin/zsh

[ -z "$SSH_AGENT_PID" ] && { eval "$(ssh-agent)"; } >/dev/null 2>&1
