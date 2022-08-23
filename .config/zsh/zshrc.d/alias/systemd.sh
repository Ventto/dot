#!/bin/sh

alias klog="journalctl --dmesg -o short"
alias klog-live="journalctl --dmesg -o short -f -n 50"
