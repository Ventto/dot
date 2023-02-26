#!/usr/bin/env bash

cdir="$(dirname "$(realpath -L "$0")")"
theme="style"
rofi -show drun -theme "${cdir}/${theme}.rasi"
