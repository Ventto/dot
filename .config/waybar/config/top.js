{
    "layer": "top",
    "position": "top",

    "modules-left": [
        "sway/workspaces",
        "custom/right-arrow-dark"
    ],
    "modules-center": [
        "custom/right-arrow-light",
        "clock",
        "custom/right-arrow-dark"
    ],
    "modules-right": [
        "custom/right-arrow-light",
        "custom/disk-partitions",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "temperature",
        "cpu",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "memory",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "backlight",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "pulseaudio",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "battery",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "custom/logout",
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
    "sway/workspaces": {
        "disable-scroll": true,
        "format": "{name}",
        "tooltip": false
    },
    "clock": {
        "format": "{:%A  %d %b  %H:%M}",
        "tooltip": false
    },
    "custom/disk-partitions": {
        "format": " {}",
        "interval": 10,
        "exec": "df -h --output=avail / /home | tail -n 2 | tr -d ' ' | tr '\n' ' ' | sed -e 's%.$%%'",
        "tooltip": false
    },
    "backlight": {
        "device": "intel_backlight",
        "format": "{icon} {percent}%",
        "format-icons": [ "", "", ""],
        "tooltip": false
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-bluetooth": "{icon} {volume}% ",
        "format-muted": "",
        "format-icons": {
            "headphones": "",
            "default": [ "", "" ]
        },
        "scroll-step": 1,
        "on-click": "pavucontrol"
    },
    "memory": {
        "interval": 3,
        "format": " {}%",
        "tooltip": true
    },
    "temperature": {
        "thermal-zone": 2,
	    "hwmon-path": "/sys/class/hwmon/hwmon5/temp1_input",
        "critical-threshold": 80,
        "format-critical": "{temperatureC}°C ",
        "format": "{temperatureC}°C "
    },
    "cpu": {
        "interval": 3,
        "format": " {usage}%",
        "max-length": 10
    },
    "battery": {
        "bat": "BAT0",
        "interval": 60,
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-charging": "+ {capacity}%",
        "format-icons": [ "", "", "", "", "" ]
    },
    "custom/logout": {
        "format": "",
        "on-click": "wlogout -p layer-shell -b 2",
        "tooltip": false
    }
}
