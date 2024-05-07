{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [ hyprpicker ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    settings = let
      active = "0xaa${lib.removePrefix "#" config.colorScheme.palette.base08}";
      inactive =
        "0xaa${lib.removePrefix "#" config.colorScheme.palette.base00}";
    in {
      exec-once = ''
        ${pkgs.waybar}/bin/waybar &
      '';
      bind = let
        grimblast = lib.getExe pkgs.inputs.hyprwm-contrib.grimblast;
        # tesseract = lib.getExe pkgs.tesseract;
        # pactl = lib.getExe' pkgs.pulseaudio "pactl";
        # notify-send = lib.getExe' pkgs.libnotify "notify-send";
        # defaultApp = type: "${lib.getExe pkgs.handlr-regex} launch ${type}";
        # [ "SUPER, a, exec,${defaultApp "x-scheme-handler/terminal"}" ];
      in [
        "SUPER, Return, exec, ${pkgs.alacritty}/bin/alacritty"
        "SUPER, W, exec, ${pkgs.rofi}/bin/rofi -show drun"
      ];
      general = {
        resize_on_border = true;
        cursor_inactive_timeout = 4;
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = active;
        "col.inactive_border" = inactive;
      };
      group = {
        "col.border_active" = active;
        "col.border_inactive" = inactive;
        groupbar.font_size = 11;
      };
      binds = { movefocus_cycles_fullscreen = false; };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle,caps:escape";
        touchpad.disable_while_typing = false;
      };
    };

  };
}
