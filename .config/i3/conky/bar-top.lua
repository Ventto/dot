-- vim: ts=4 sw=4 noet ai cindent expandtab

cfg = assert (loadfile (os.getenv("HOME") .. "/.config/i3/conky/conky.lua"))
cfg()

i3bar = {
    storage = [[
        {
            "full_text":"  ${fs_free /} -   ${fs_free /home}",
            "border": "\#DC7633",
            "border_bottom": 2,
            "border_top": 0,
            "border_left": 0,
            "border_right": 0
        }
    ]],
    ram = [[
        {
            "full_text":"  $mem/ $memperc% -   ${cpu cpu0}",
            "border": "\#A569BD",
            "border_bottom": 2, "border_top": 0, "border_left": 0, "border_right": 0
        }
    ]],
    backlight = [[
        {
            ${if_match "${exec lux -G | sed -n 's/.*\(%\)$/\1/p'}" == "%"}
                "full_text":"  ${exec lux -G}",
            ${else}
                "full_text":" !",
                "color": "\#F08080",
            ${endif}

            "border": "\#F5B041",
            "border_bottom": 2, "border_top": 0, "border_left": 0, "border_right": 0
        }
    ]],
    sound = [[
        ${if_match "${exec amixer -c 0 get Master | grep Mono: | grep -o "off"}" == "off"}
            {
                "full_text":" !",
                "color": "\#F08080"
            }
        ${else}
            {
                ${if_match "${exec pacmd list-sinks | \
                    sed -n 's/.*active port: <analog-output-\(.*\)>/\1/p'}" == "speaker"}
                    "full_text":"  ${exec amixer -c 0 get Master | grep Mono: | \
                    cut -d' ' -f6 | grep -E -o "[0-9]{1,3}"}",
                ${else}
                    ${if_match "${exec pacmd list-sinks | \
                        sed -n 's/.*active port: <analog-output-\(.*\)>/\1/p'}" == "headphones"}
                        "full_text":"   ${exec amixer -c 0 get Master | grep Mono: | \
                        cut -d' ' -f6 | grep -E -o "[0-9]{1,3}"}",
                    ${else}
                        "full_text":"  ?",
                    ${endif}
                ${endif}

                "border": "\#DF0000",
                "border_bottom": 2, "border_top": 0, "border_left": 0, "border_right": 0
            }
        ${endif}
    ]],
    battery = [[
        {
            "full_text":

            ${if_empty ${battery BAT0}}
                "  !", "color": "\#F08080",
            ${else}
                ${if_match "$acpiacadapter" != "on-line"}
                    "  $battery_percent",
                    ${if_match $battery_percent <= 15}
                        "color": "\#F08080",
                    ${endif}
                ${else}
                    "  $battery_percent",
                ${endif}
            ${endif}

            "border": "\#E5E7E9",
            "border_bottom": 2, "border_top": 0, "border_left": 0, "border_right": 0
        }
    ]],
    time = [[
        {
            "full_text":"  $tztime",
            "border": "\#E5E7E9",
            "border_bottom": 2,
            "border_top": 0,
            "border_left": 0,
            "border_right": 0
        }
    ]],
    gap = [[
        { "full_text": "" }
    ]]
}

conky.text = [[
    [
        ]] .. i3bar.storage .. [[,
        ]] .. i3bar.ram .. [[,
        ]] .. i3bar.backlight .. [[,
        ]] .. i3bar.sound .. [[,
        ]] .. i3bar.battery .. [[,
        ]] .. i3bar.time .. [[,
        ]] .. i3bar.gap .. [[
    ],
]]
