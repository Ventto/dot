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
        "custom/bluetooth",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/usb-serial",
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
    "custom/bluetooth": {
        "format": "{}",
        "return-type": "json",
        "exec": "${HOME}/.config/waybar/modules/bluetooth/exec.sh",
        "on-click": "${HOME}/.config/waybar/modules/bluetooth/onclick.sh",
        "interval": 3
    },
    "custom/usb-serial": {
        "format": "{}",
        "return-type": "json",
        "exec": "${HOME}/.config/waybar/modules/usb-serial/exec.sh",
        "interval": 5
    },
    "network": {
        "format-wifi": "<span color='#589df6'></span> <span color='gray'>{essid}</span> <span color='#589df6'>{signalStrength}%</span> {ipaddr}/{cidr}",
        "format-ethernet": " {ifname}: {ipaddr}/{cidr}",
        "format-linked": " {ifname} (No IP)",
        "format-disconnected": "Disconnected ",
        "interval": 3,
        "on-click": "${HOME}/.config/waybar/modules/network/onclick.sh",
        "on-click-right": "${HOME}/.config/waybar/modules/network/onclick-right.sh",
        "tooltip": false
    },
    "tray": {
        "icon-size": 21,
        "spacing": 14
    }
}
