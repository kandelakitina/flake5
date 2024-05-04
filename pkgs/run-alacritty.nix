{ pkgs, ... }:

# Runs a new instance of Alacritty or brings it to focus if it exists already
pkgs.writeShellScriptBin "run-alacritty" ''
  # Check if Alacritty is running on the current workspace
  ALACRITTY_WINDOW_ID=$(wmctrl -lx | grep -i alacritty.Alacritty | grep $(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}') | awk '{print $1}')

  if [ -n "$ALACRITTY_WINDOW_ID" ]; then
    # If Alacritty is running on the current workspace, focus it
    wmctrl -ia "$ALACRITTY_WINDOW_ID"
  else
    # If Alacritty is not running on the current workspace, start a new instance
    alacritty &
  fi
    # if pgrep -x "alacritty" > /dev/null; then
    #     ALACRITTY_WID=$(xdotool search --onlyvisible --class alacritty | head -n 1)
    #     CURRENT_WORKSPACE=$(xdotool get_desktop)
    #     if [ -n "$ALACRITTY_WID" ]; then
    #         xdotool set_desktop_for_window $ALACRITTY_WID $CURRENT_WORKSPACE
    #         xdotool windowactivate $ALACRITTY_WID
    #     else
    #         alacritty &
    #     fi
    # else
    #     alacritty &
    # fi
''
