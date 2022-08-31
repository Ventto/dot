{
    "layer": "top",
    "position": "top",

    "modules-left": [
        "sway/workspaces",
    ],
    "modules-center": [
    ],
    "modules-right": [
        "idle_inhibitor",
        "custom/disk-partitions",
        "temperature",
        "cpu",
        "memory",
        "backlight",
        "pulseaudio",
        "battery",
        "custom/logout",
    ],

    "sway/workspaces": {
        "disable-scroll": true,
        "format": "{name}",
        "tooltip": false
    },
    "idle_inhibitor": {
        "format": "{icon}",
        "format-icons": {
            "activated": "",
            "deactivated": ""
        }
    },
    "custom/disk-partitions": {
        "format": " {}",
        "interval": 10,
        "exec": "df -h --output=avail / /home | tail -n 2 | tr -d ' ' | tr '\n' ' ' | sed -e 's%.$%%'",
        "tooltip": false
    },
    "backlight": {
        "device": "intel_backlight",
        "format": " {percent}%",
        "exec": "echo",
        "exec-if": "laptop-detect && swaymsg -t get_outputs | jq -r '.[]  | \"\\(.name) \\(.active)\"' | grep 'eDP-1 true'",
        "tooltip": false
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-bluetooth": "{icon} {volume}% ",
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
        "format": "﬙ {}%",
        "tooltip": true
    },
    "temperature": {
        "thermal-zone": 2,
	    "hwmon-path": "/sys/class/hwmon/hwmon5/temp1_input",
        "critical-threshold": 80,
        "format-critical": " {temperatureC}°C",
        "format": " {temperatureC}°C",
        "max-length": 10
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
        "on-click": "${HOME}/.config/rofi/scripts/powermenu",
        "tooltip": false
    }
}
