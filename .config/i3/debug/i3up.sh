#!/bin/sh -

cat ~/.config/i3/i3config.d/* > ~/.config/i3/config && i3-msg "restart"
