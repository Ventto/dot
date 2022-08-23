{
    "layer": "top",
    "position": "bottom",

    "modules-left": [
        "tray",
    ],
    "modules-center": [
        "clock",
        "custom/clock-sao",
        "custom/clock-las",
    ],
    "modules-right": [
        "custom/bluetooth",
        "custom/usb-serial",
    ],
    "clock": {
        "format": "{: %a %d %b, Week %W |  Paris %H:%M}",
        "timezone": "Europe/Paris",
        "interval": 60,
        "tooltip": false
    },
    "custom/clock-sao": {
        "format": "Sao Paolo {}",
        "exec": "TZ=America/Sao_Paulo date +%H:%M",
        "interval": 60,
        "tooltip": false
    },
    "custom/clock-las": {
        "format": "Los Angeles {}",
        "exec": "TZ=US/Pacific date +%H:%M",
        "interval": 60,
        "tooltip": false
    },
    "custom/bluetooth": {
        "format": "{}",
        "return-type": "json",
        "exec": "${HOME}/.config/waybar/modules/bluetooth/exec.sh",
        "on-click": "blueman-manager",
        "interval": 3
    },
    "custom/usb-serial": {
        "format": "{}",
        "return-type": "json",
        "exec": "${HOME}/.config/waybar/modules/usb-serial/exec.sh",
        "interval": 5
    },
    "tray": {
        "icon-size": 21,
        "spacing": 14
    }
}
