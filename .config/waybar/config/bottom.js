{
    "layer": "top",
    "position": "bottom",

    "modules-left": [
        "tray",
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
    "tray": {
        "icon-size": 21,
        "spacing": 14
    }
}
