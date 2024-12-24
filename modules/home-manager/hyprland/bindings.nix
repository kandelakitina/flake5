{ config, pkgs, lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    bindm = [ "SUPER,mouse:272,movewindow" "SUPER,mouse:273,resizewindow" ];

    bind = let
      grimblast = lib.getExe pkgs.inputs.hyprwm-contrib.grimblast;
      tesseract = lib.getExe pkgs.tesseract;
      pactl = lib.getExe' pkgs.pulseaudio "pactl";
      notify-send = lib.getExe' pkgs.libnotify "notify-send";
      # defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
      # workspaces = [
      #   "0"
      #   "1"
      #   "2"
      #   "3"
      #   "4"
      #   "5"
      #   "6"
      #   "7"
      #   "8"
      #   "9"
      #   "F1"
      #   "F2"
      #   "F3"
      #   "F4"
      #   "F5"
      #   "F6"
      #   "F7"
      #   "F8"
      #   "F9"
      #   "F10"
      #   "F11"
      #   "F12"
      # ];
      # Map keys (arrows and hjkl) to hyprland directions (l, r, u, d)
      directions = rec {
        left = "l";
        right = "r";
        up = "u";
        down = "d";
        h = left;
        l = right;
        k = up;
        j = down;
      };
    in [
      "SUPER, W, exec, ${pkgs.wofi}/bin/wofi -S drun"
      "SUPER, D, exec, ${pkgs.wofi}/bin/wofi -S run"
      "SUPER, B, exec, ${pkgs.firefox}/bin/firefox --show drun"
      "SUPER, V, exec, ${pkgs.cliphist}/bin/cliphist list | wofi --dmenu | cliphist decode | wl-copy"
      "SUPER, O, exec, ${pkgs.obsidian}/bin/obsidian"
      "SUPER, T, exec, ${pkgs.telegram-desktop}/bin/telegram-desktop"

      ",XF86MonBrightnessUp,exec,brightnessctl set 5%+"
      ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"

      # Volume
      ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,exec,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Screenshotting
      ",Print,exec,${grimblast} --notify --freeze copy output"
      "SUPERSHIFT,s,exec,${grimblast} --notify --freeze copy area"

      # To OCR
      "ALT,Print,exec,${grimblast} --freeze save area - | ${tesseract} - - | wl-copy && ${notify-send} -t 3000 'OCR result copied to buffer'"

      "SUPER,q,killactive"
      "SUPERSHIFT,e,exit"

      "SUPER,s,togglesplit"
      "SUPER,space,fullscreen,1"
      "SUPERSHIFT,space,fullscreen,0"
      "SUPER,f,togglefloating"

      "SUPER,minus,splitratio,-0.25"
      "SUPERSHIFT,minus,splitratio,-0.3333333"

      "SUPER,equal,splitratio,0.25"
      "SUPERSHIFT,equal,splitratio,0.3333333"

      "SUPER,g,togglegroup"
      "SUPER,t,lockactivegroup,toggle"
      "SUPER,tab,changegroupactive,f"
      "SUPERSHIFT,tab,changegroupactive,b"

      "SUPER,apostrophe,workspace,previous"
      "SUPERSHIFT,apostrophe,workspace,next"

      "SUPER,u,togglespecialworkspace"
      "SUPERSHIFT,u,movetoworkspacesilent,special"
      "SUPER,i,pseudo"

      "SUPER, backspace, exec, shutdown-script" # custom script

      "SUPER, C ,exec, hyprpicker -a"
      "SUPER,1,workspace,1"
      "SUPER,2,workspace,2"
      "SUPER,3,workspace,3"
      "SUPER,4,workspace,4"
      "SUPER,5,workspace,5"
      "SUPER,6,workspace,6"
      "SUPER,7,workspace,7"
      "SUPER,8,workspace,8"
      "SUPER,9,workspace,9"
      "SUPER,0,workspace,10"
      "SUPERALT,UP,workspace,e+1"
      "SUPERALT,DOWN,workspace,e-1"

      "SUPERSHIFT,1,movetoworkspace,1"
      "SUPERSHIFT,2,movetoworkspace,2"
      "SUPERSHIFT,3,movetoworkspace,3"
      "SUPERSHIFT,4,movetoworkspace,4"
      "SUPERSHIFT,5,movetoworkspace,5"
      "SUPERSHIFT,6,movetoworkspace,6"
      "SUPERSHIFT,7,movetoworkspace,7"
      "SUPERSHIFT,8,movetoworkspace,8"
      "SUPERSHIFT,9,movetoworkspace,9"
      "SUPERSHIFT,0,movetoworkspace,10"
    ] ++

    # # Screen lock
    # (let swaylock = lib.getExe config.programs.swaylock.package;
    # in lib.optionals config.programs.swaylock.enable
    # [ "SUPER, backspace, exec, ${swaylock} -S --grace 2" ]) ++

    # # Change workspace
    # (map (n: "SUPER,${n},workspace,name:${n}") workspaces) ++
    # # Move window to workspace
    # (map (n: "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}") workspaces) ++

    # Move focus
    (lib.mapAttrsToList (key: direction: "SUPER,${key},movefocus,${direction}")
      directions) ++
    # Swap windows
    (lib.mapAttrsToList
      (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}") directions)
    ++
    # Move windows
    (lib.mapAttrsToList
      (key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}")
      directions) ++
    # Move monitor focus
    (lib.mapAttrsToList
      (key: direction: "SUPERALT,${key},focusmonitor,${direction}") directions)
    ++
    # Move workspace to other monitor
    (lib.mapAttrsToList (key: direction:
      "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}")
      directions);
  };
}
