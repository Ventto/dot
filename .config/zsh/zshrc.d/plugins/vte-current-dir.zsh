#!/bin/zsh

##
# Help to open a new terminal from current directory:
#
# One aspect of VTE configuration is the use of /etc/profile.d/vte.sh.
# The VTE uses this script to override the PROMPT_COMMAND in order
# to feed itself additional information via terminal control codes.
# In particular, this script is used to tell the VTE the current directory
# of the shell.
# (https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue)
#
if [[ $- == *i* ]]; then
    if ! . "/etc/profile.d/vte.sh" > /dev/null 2>&1; then
        if ! . "/usr/local/etc/profile.d/vte.sh" > /dev/null 2>&1; then
            echo "Error: feature/open a new terminal from current directory"
            echo "Error: cannot find 'vte.sh'"
        else
            __vte_osc7
        fi
    else
        __vte_osc7
    fi
fi
