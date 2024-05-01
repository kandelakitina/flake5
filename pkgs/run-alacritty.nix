{ pkgs, ... }:

# Runs a new instance of Alacritty or brings it to focus if it exists already
pkgs.writeShellScriptBin "run-alacritty" ''
  if pgrep -x "alacritty" > /dev/null; then
      ALACRITTY_WID=$(xdotool search --onlyvisible --class alacritty | head -n 1)
      CURRENT_WORKSPACE=$(xdotool get_desktop)
      if [ -n "$ALACRITTY_WID" ]; then
          xdotool set_desktop_for_window $ALACRITTY_WID $CURRENT_WORKSPACE
          xdotool windowactivate $ALACRITTY_WID
      else
          alacritty &
      fi
  else
      alacritty &
  fi
''
