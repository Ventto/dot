#!/bin/sh

banner()
{
    printf "#=================================#\n"
    printf "#         Waybar: Bluetooth       #\n"
    printf "#=================================#\n\n"
}

run_script()
{
    if ! systemctl status bluetooth | \
        grep 'active (running)' >/dev/null 2>&1; then
            printf "Start the bluetooth service...\n\n"
            sudo systemctl start bluetooth || exit 1
    fi
    bluetoothctl power on && bluetoothctl
}

open_term()
{
    nohup termite -c "${HOME}/.config/termite/config_dmenu" \
                  --name waybar-onclick \
                  -e "zsh -c 'IS_SCRIPT=1 $0'" >/dev/null 2>&1 &
}

waybar_action()
{
    if [ -z "$IS_SCRIPT" ]; then
        open_term
    else
        banner
        run_script
    fi
}

waybar_action "$@"
