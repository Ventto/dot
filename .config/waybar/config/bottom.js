{
    "layer": "top",
    "position": "bottom",

    "modules-left": [
        "tray",
        "custom/right-arrow-dark"
    ],
    "modules-center": [
        "custom/right-arrow-light",
        "network",
        "custom/right-arrow-dark"
    ],
    "modules-right": [
        "custom/right-arrow-light",
        "custom/bluetooth-devices",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/storage-devices",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/serial-devices",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/disk-root",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/disk-home",
        "custom/right-arrow-dark",

        "custom/right-arrow-light"
    ],
    "custom/left-arrow-dark": {
        "format": "",
        "tooltip": false
    },
    "custom/left-arrow-light": {
        "format": "",
        "tooltip": false
    },
    "custom/right-arrow-dark": {
        "format": "",
        "tooltip": false
    },
    "custom/right-arrow-light": {
        "format": "",
        "tooltip": false
    },
    "custom/disk-home": {
        "format": "home {} ",
        "interval": 30,
        "exec": "df -h --output=avail $HOME | tail -1 | tr -d ' '"
    },
    "custom/disk-root": {
        "format": "root {} ",
        "interval": 30,
        "exec": "df -h --output=avail / | tail -1 | tr -d ' '"
    },
    "custom/bluetooth-devices": {
        "format": "{}",
        "exec": "${HOME}/.config/waybar/modules/bluetooth/exec.sh",
        "on-click": "termite -c /home/ventto/.config/termite/config_dmenu --name waybar-onclick -e \"zsh -c 'bluetoothctl'\"",
        /* "on-click": "${HOME}/.config/waybar/modules/bluetooth/onclick.sh", */
        "interval": 3
    },
    "custom/serial-devices": {
        "format": " x {} ",
        "exec": "${HOME}/.config/waybar/modules/serial.sh",
        "interval": 5
    },
    "custom/storage-devices": {
        "format": " x {} ",
        "exec": "${HOME}/.config/waybar/modules/storage.sh",
        "interval": 5
    },
    "network": {
        "format-wifi": "<span color='#589df6'></span> <span color='gray'>{essid}</span> <span color='#589df6'>{signalStrength}%</span> {ipaddr}/{cidr}",
        "format-ethernet": " {ifname}: {ipaddr}/{cidr}",
        "format-linked": " {ifname} (No IP)",
        "format-disconnected": "Disconnected ",
        "format-alt": "{ifname}: {ipaddr}/{cidr}",
        "interval": 3,
        "tooltip": false
    }
}
