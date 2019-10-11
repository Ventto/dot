{
	"layer": "top",
	"position": "top",

	"modules-left": [
		"sway/workspaces",
		"custom/right-arrow-dark"
	],
	"modules-center": [
		"custom/left-arrow-dark",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"clock#1",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"clock#2",
		"custom/right-arrow-dark",

		"custom/right-arrow-light",
		"clock#3",
		"custom/right-arrow-dark",

		"custom/right-arrow-light",
		"custom/right-arrow-dark"
	],
	"modules-right": [
		"custom/left-arrow-dark",
		"temperature",
		"cpu",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"memory",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"backlight",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"pulseaudio",
		"custom/left-arrow-light",

		"custom/left-arrow-dark",
		"battery",
		"custom/left-arrow-light",

		"custom/left-arrow-dark"
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
    "backlight": {
        "format": "{icon} {percent}%",
        "format-alt": "{percent}% {icon}",
        "format-alt-click": "click-right",
        "format-icons": [ "" ]
    },
	"pulseaudio": {
		"format": "{icon} {volume}%",
		"format-bluetooth": "{icon} {volume}%",
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
		"format-icons": [ "", "", "", "", "" ]
	},
	"tray": {
		"icon-size": 20
	}
}
