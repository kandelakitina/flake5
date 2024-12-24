#!/usr/bin/env bash

# Check if hyprctl is installed
if ! command -v hyprctl &> /dev/null; then
    echo "Error: hyprctl is not installed or not in PATH."
    exit 1
fi

# Get the active workspace
current_workspace=$(hyprctl monitors -j | jq -r '.[].activeWorkspace.id')

# Get the window address of Alacritty on the current workspace
alacritty_window=$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $current_workspace and .class == \"Alacritty\") | .address")

if [ -n "$alacritty_window" ]; then
    # Focus the Alacritty window on the current workspace
    hyprctl dispatch focuswindow address:$alacritty_window
else
    # Launch Alacritty
    alacritty &
fi
