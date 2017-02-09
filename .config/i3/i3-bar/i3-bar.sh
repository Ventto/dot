#!/bin/sh

echo '{"version":1}'
echo '['
echo '[],'

case "$1" in
    top)    exec conky -c ~/.config/i3/i3-bar/conky-bar-top.conf ;;
    bottom) exec conky -c ~/.config/i3/i3-bar/conky-bar-btm.conf ;;
esac
