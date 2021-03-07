#!/bin/sh

#######################################
# Checks if an application has one of its windows in fullscreen mode
# ARGUMENTS:
#   $1: application PID
# RETURN:
#   0 on succeeds, non-zero on error.
#######################################
app_has_fullscreen_window()
{
    pid="$1"
    swaymsg -t get_tree | \
        grep -Ei "\"pid\": ${pid}," -B 20 |\
        grep -E '"fullscreen_mode": [01],' | tail -n1 |\
        grep -E '"fullscreen_mode": 1,' >/dev/null 2>&1
}

#######################################
# Prints the PID of any application which is using PulseAudio
# OUTPUTS:
#   Write application's binary names in column to stdout
# RETURN:
#   Always succeeds.
#######################################
pulseaudio_list_running_sink_input_app_pids()
{
    pacmd_output="$(pacmd list-sink-inputs)"
    input_list="$(echo "$pacmd_output" | grep -E '    index: [0-9]+')"

    [ -z "$input_list" ] && return

    echo "$input_list" |
    while IFS= read -r input; do
        input_data="$(echo "$pacmd_output" | \
            awk "/${input}/{flag=1;next} /    index: /{flag=0}flag")"
        if ! echo "$input_data" | grep 'state: RUNNING' >/dev/null 2>&1; then
            continue
        fi
        echo "$input_data" | sed -n 's/.*application.process.id = "\(.*\)"/\1/p'
    done
}

#######################################
# Checks if any application's fullscreen window is using PulseAudio
# RETURN:
#   0 on succes, 1 on error.
#######################################
is_watching_movie()
{
    app_pids="$(pulseaudio_list_running_sink_input_app_pids)"
    for pid in $app_pids; do
        if app_has_fullscreen_window "$pid"; then
            return 0
        fi
    done
    return 1
}

is_watching_movie
