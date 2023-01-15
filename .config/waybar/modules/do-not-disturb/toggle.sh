#!/usr/bin/env bash

if [[ $(makoctl mode | tail -n 1) == default ]]; then
    makoctl mode -a do-not-disturb
else
    makoctl mode -r do-not-disturb
fi
