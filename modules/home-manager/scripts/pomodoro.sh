#!/usr/bin/env bash

STATE_FILE="$HOME/.pomodoro_status"
DEFAULT_DURATION=25  # minutes
DEFAULT_BREAK=5      # minutes

function start() {
    local end_time=$(($(date +%s) + $((DEFAULT_DURATION * 60))))
    echo "pomodoro $end_time" > "$STATE_FILE"
}

function break_time() {
    local end_time=$(($(date +%s) + $((DEFAULT_BREAK * 60))))
    echo "break $end_time" > "$STATE_FILE"
}

function stop() {
    rm -f "$STATE_FILE"
}

function status() {
    if [ ! -f "$STATE_FILE" ]; then
        if [ "$WAYBAR" = "1" ]; then
            printf '{"text": " ", "class": "inactive"}'
        else
            echo "Pomodoro not started"
        fi
        exit
    fi

    read mode end_time < "$STATE_FILE"
    local now=$(date +%s)
    local remaining=$((end_time - now))

    if [ $remaining -le 0 ]; then
        notify-send -u normal "Pomodoro Timer" "$mode finished!"
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga 
        rm -f "$STATE_FILE"

        if [ "$WAYBAR" = "1" ]; then
            echo '{"text": "done", "class": "done"}'
        else
            echo "Pomodoro $mode is done"
        fi
    else
        local min=$((remaining / 60))
        local sec=$((remaining % 60))
        if [ "$WAYBAR" = "1" ]; then
            if [ "$mode" = "pomodoro" ]; then
                printf '{"text": "%02d:%02d", "class": "active"}\n' "$min" "$sec"
            else
                printf '{"text": "Break %02d:%02d", "class": "break"}\n' "$min" "$sec"
            fi
        else
            printf "%s %02d:%02d\n" "$mode" "$min" "$sec"
        fi
    fi
}

case "$1" in
    start) start ;;
    break) break_time ;;
    stop) stop ;;
    status) status ;;
    *) echo "Usage: $0 {start|break|stop|status}";;
esac
