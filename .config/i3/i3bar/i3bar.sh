#!/bin/sh

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c "$HOME/.config/i3/i3bar/conky/build/i3bar-$1-$2.conf"
