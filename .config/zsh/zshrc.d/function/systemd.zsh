#!/bin/zsh

function dontsleep()
{
    systemd-inhibit \
        --what "sleep:idle:handle-suspend-key:handle-hibernate-key:handle-lid-switch:handle-power-key" \
        --why "Important Shell CLI task" \
        bash -c "$@"
}
