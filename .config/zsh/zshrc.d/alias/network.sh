#!/bin/sh

alias bluetooth-on='sudo systemctl start bluetooth.service'
alias bluetooth-off='sudo systemctl stop bluetooth.service'
alias wifi-on='sudo rfkill unblock wifi && sudo ip link set wlo0 up'
alias wifi-list='watch -c -n 1 nmcli -c yes -f SSID,BSSID,BARS,ACTIVE,CHAN,SECURITY dev wifi list'
alias wifi-connect='nmtui-connect'
