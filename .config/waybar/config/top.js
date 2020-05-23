{
    "layer": "top",
    "position": "top",

    "modules-left": [
        "sway/workspaces",
        "custom/right-arrow-dark"
    ],
    "modules-center": [
        "custom/right-arrow-light",
        "clock#1",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "clock#2",
        "custom/right-arrow-dark",

        "custom/right-arrow-light",
        "clock#3",
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
        "format": "{name}"
    },

    "clock#1": {
        "format": "{:%A}",
        "tooltip": false
    },
    "clock#3": {
        "format": "{:%H:%M}",
        "tooltip": false
    },
    "clock#2": {
        "format": "{:%d %b}",
        "tooltip": false
    },
    "custom/disk-partitions": {
        "format": " {}",
        "interval": 30,
        "exec": "df -h --output=avail / /home | tail -n 2 | tr -d ' ' | tr '\n' ' ' | sed -e 's%.$%%'"
    },
    "backlight": {
        "format": "{icon} {percent}%",
        "format-alt": "{percent}% {icon}",
        "format-alt-click": "click-right",
        "format-icons": [ "" ]
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-bluetooth": "{icon} {volume}% ",
        "format-muted": " x",
        "format-icons": {
            "headphones": "",
            "default": [ "", "" ]
        },
        "scroll-step": 1,
        "on-click": "pavucontrol"
    },
    "memory": {
        "interval": 2,
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
        "interval": 2,
        "format": " {usage}%",
        "max-length": 10
    },
    "battery": {
        "interval": 2,
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 15
        },
        "format": "{icon} {capacity}%",
        "format-charging": "+ {capacity}%",
        "format-icons": [ "", "", "", "", "" ]
    }
}
