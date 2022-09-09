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
        "bluetooth",
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
    "bluetooth": {
	    "format": " on",
	    "format-disabled": " off", // an empty format will hide the module
	    "format-connected": " x {num_connections}",
	    "tooltip-format": "{controller_alias}\t{controller_address}",
	    "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{device_enumerate}",
	    "tooltip-format-enumerate-connected": "{device_alias}\t{device_address}",
        "on-click": "blueman-manager",
        "on-click-right": "blueman-adapters"
    },
    "custom/usb-serial": {
        "format": "{}",
        "return-type": "json",
        "exec": "${HOME}/.config/waybar/modules/usb-serial/exec.sh",
        "interval": 5
    },
    "tray": {
        "icon-size": 21,
        "spacing": 30
    }
}
