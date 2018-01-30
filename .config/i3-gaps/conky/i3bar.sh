#!/bin/sh

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c "$HOME/.config/i3-gaps/conky/build/i3bar-$2-$1.conf"
