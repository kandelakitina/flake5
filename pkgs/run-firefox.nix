{ pkgs, ... }:

pkgs.writeShellScriptBin "run-firefox" ''
  #!/bin/bash
  # Check if a Firefox window is already open on the current workspace
  FIREFOX_WINDOW_ID=$(wmctrl -lx | grep -i "Mozilla Firefox" | grep $(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}') | awk '{print $1}')

  if [ -n "$FIREFOX_WINDOW_ID" ]; then
      # If Firefox is running on the current workspace, focus it
      wmctrl -ia "$FIREFOX_WINDOW_ID"
  else
      # If Firefox is not running on the current workspace, start a new instance
      firefox &
  fi
''
