#!/bin/sh

test "$(cat /sys/class/power_supply/AC/online)" = "1"
