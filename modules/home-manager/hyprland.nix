{ pkgs, lib, ... }: {

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      # Same as default, but stop graphical-session too
      # extraCommands = lib.mkBefore [
      #   "systemctl --user stop graphical-session.target"
      #   "systemctl --user start hyprland-session.target"
      # ];
    };

    settings = {
      exec-once = ''
        ${pkgs.waybar}/bin/waybar &
      '';
      bind =
        # let
        # grimblast = lib.getExe pkgs.inputs.hyprwm-contrib.grimblast;
        # tesseract = lib.getExe pkgs.tesseract;
        # pactl = lib.getExe' pkgs.pulseaudio "pactl";
        # notify-send = lib.getExe' pkgs.libnotify "notify-send";
        # defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
        # in 
        # [ "SUPER, a, exec,${defaultApp "x-scheme-handler/terminal"}" ];
        [
          "SUPER, Return, exec, ${pkgs.alacritty}/bin/alacritty"
          "SUPER, W, exec, ${pkgs.rofi}/bin/rofi -show drun"
        ];
    };

  };
}
