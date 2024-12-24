#!/usr/bin/env bash

# Check if hyprctl is installed
if ! command -v hyprctl &> /dev/null; then
    echo "Error: hyprctl is not installed or not in PATH."
    exit 1
fi

# Get the active workspace
current_workspace=$(hyprctl monitors -j | jq -r '.[].activeWorkspace.id')

# Get the window address of Firefox on the current workspace
firefox_window=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $current_workspace and .class == \"firefox\") | .address")

if [ -n "$firefox_window" ]; then
    # Focus the Firefox window on the current workspace
    hyprctl dispatch focuswindow address:$firefox_window
else
    # Launch Firefox
    firefox &
fi
