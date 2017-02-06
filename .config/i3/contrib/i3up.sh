#!/bin/sh -

cat $HOME/.config/i3/i3-config/* > "$HOME/.config/i3/config" && i3-msg "restart"
