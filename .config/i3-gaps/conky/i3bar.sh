#!/bin/sh

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c "$HOME/.config/i3-gaps/conky/bar-$1.config"
