-- vim: ts=4 sw=4 noet ai cindent expandtab

cfg = assert (loadfile (os.getenv("HOME") .. "/.config/i3/conky/conky.lua"))
cfg()

my = {
    network = {
        eth = "eth0",
        wlan  = "wlo0"
    }
}

icon = {
    eth  = "",
    wlan = "",
    bluetooth = "",
    usb = "",
    serial = "",
}

i3bar = {
    eth = [[
        ${if_empty "${exec ip addr show ]] .. my.network.eth .. [[ up}"}
            {
                "full_text":"]] .. icon.eth .. [[ x",
                "color": "\#F08080"
            }
        ${else}
            ${if_up ]] .. my.network.eth .. [[}
                {
                    "full_text":"]] .. icon.eth .. [[  - ${totaldown ]] ..
                            my.network.eth .. [[}  ${downspeed ]] ..
                            my.network.eth .. [[}  ${upspeed ]] ..
                            my.network.eth .. [[} ",
                        "border": "\#9FBC00",
                        "border_bottom": 2,
                        "border_top": 0,
                        "border_left": 0,
                        "border_right": 0
                    }
            ${else}
                {
                    "full_text":"]] .. icon.eth .. [[ !",
                    "color": "\#F08080"
                }
            ${endif}
        ${endif}
    ]],
    wlan = [[
        ${if_match "${exec rfkill -n list wifi \
            | sed -n 's%.*blocked: \(yes\)%\1%p' \
            | head -n1}" == "yes" }
            {
                "full_text":"]] .. icon.wlan .. [[ x",
                "color": "\#F08080"
            }
        ${else}
            ${if_up ]] .. my.network.wlan .. [[}
                {
                    "full_text":"]] .. icon.wlan
                        .. [[ ${wireless_link_qual ]] .. my.network.wlan
                        .. [[ }- ${totaldown ]] .. my.network.wlan
                        .. [[ }  ${downspeed ]] .. my.network.wlan
                        .. [[ }  ${upspeed ]] .. my.network.wlan
                        .. [[ }",
                    "border": "\#9FBC00",
                    "border_bottom": 2,
                    "border_top": 0,
                    "border_left": 0,
                    "border_right": 0
                }
            ${else}
                {
                    "full_text":"]] .. icon.wlan .. [[ !",
                    "color": "\#F08080"
                }
            ${endif}
        ${endif}
    ]],
    bluetooth = [[
        ${if_match "${exec rfkill -n list bluetooth \
            | sed -n 's%.*blocked: \(yes\)%\1%p' \
                | head -n1}" == "yes" }
            {
                "full_text":"]] .. icon.bluetooth .. [[ x",
                "color": "\#F08080"
            }
        ${else}
            ${if_match "${exec systemctl status bluetooth.service \
                    | sed -n 's/.*Active: \([a-z]\+\).*/\1/p'}" == "active"}
                {
                    "full_text":"]] .. icon.bluetooth .. [[ ",
                    "border": "\#9FBC00",
                    "border_bottom": 2,
                    "border_top": 0,
                    "border_left": 0,
                    "border_right": 0
                }
            ${else}
                {
                    "full_text":"]] .. icon.bluetooth .. [[ !",
                    "color": "\#F08080"
                }
            ${endif}
        ${endif}

    ]],
    usb = [[
        ${if_empty ${exec ls -1 /dev | egrep "sd[b-z]$"}}
            {
                "full_text":" !",
                "color": "\#FF8080"
            }
        ${else}
            {
                "full_text":"  ${exec ls -1 /dev | egrep "sd[a-z]$"  | wc -l}"
            }
        ${endif}
    ]],
    serial = [[
        ${if_empty ${exec ls -1 /dev | egrep "^tty(ACM|USB)[0-9]$"}}
            {
                "full_text":"]] .. icon.serial .. [[ !",
                "color": "\#FF8080"
            }
        ${else}
            {
                "full_text":"]] .. icon.serial
                    .. [[  ${exec ls -1 /dev | egrep "^tty(ACM|USB)[0-9]$" | wc -l}"
            }
        ${endif}
    ]],
    sd = [[
        ${if_empty ${exec ls -1 /dev | egrep "^mmcblk[0-9]$"}}
            { "full_text":"SD!", "color": "\#FF8080" }
        ${else}
            { "full_text":"SD" }
        ${endif}
    ]],
    gap = [[
        { "full_text": "" }
    ]],
}

conky.text = [[
    [
        ]] .. i3bar.eth .. [[,
        ]] .. i3bar.wlan .. [[,
        ]] .. i3bar.bluetooth .. [[,
        ]] .. i3bar.usb .. [[,
        ]] .. i3bar.serial .. [[,
        ]] .. i3bar.sd .. [[,
        ]] .. i3bar.gap .. [[
    ],
]]
