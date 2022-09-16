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
        "custom/disk-root",
        "custom/disk-home",
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
    "custom/disk-root": {
        "interval": 10,
        "format": " / {}",
        "exec": "df -h --output=avail / | tail -n 2 | tr '\\n' ' ' | tr -d ' ' | sed -e 's%Avail\\(.*\\)$%\\1%'",
        "tooltip": false
    },
    "custom/disk-home": {
        "interval": 10,
        "format": " /home {}",
        "exec": "df -h --output=avail /home | tail -n 2 | tr '\\n' ' ' | tr -d ' ' | sed -e 's%Avail\\(.*\\)$%\\1%'",
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
    /* Highest temperature from CPU core sensors: dell_smm-isa-0000 */
    "temperature": {
        "thermal-zone": 2,
	    "hwmon-path": "/sys/class/hwmon/hwmon7/temp1_input",
        "critical-threshold": 80,
        "format-critical": " {temperatureC}°C",
        "format": " {temperatureC}°C",
        "max-length": 10,
        "interval": 3,
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
