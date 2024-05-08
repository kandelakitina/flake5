{ config, pkgs, lib, ... }: {
  imports = [ ./bindings.nix ];
  home = {
    packages = with pkgs; [ hyprpicker cliphist wlsunset brightnessctl ];
  };

  # services.wlsunset = {
  #   enable = true;
  #   gamma = 0.6;
  #   sunrise = "14:00";
  #   sunset = "00:00";
  # };

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
      exec-once = [
        "${pkgs.waybar}/bin/waybar &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
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
        # Mouse
        sensitivity = -0.5;
        accel_profile = "flat";
        follow_mouse = 2;

        # Keyboard
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle,caps:escape";
        touchpad.disable_while_typing = false;
      };
      dwindle = {
        split_width_multiplier = 1.35;
        pseudotile = true;
      };
      misc = {
        vfr = true;
        close_special_on_empty = true;
        focus_on_activate = true;
        # Unfullscreen when opening something
        new_window_takes_over_fullscreen = 2;
      };
      decoration = {
        active_opacity = 1;
        inactive_opacity = 0.77;
        fullscreen_opacity = 1.0;
        rounding = 7;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          popups = true;
        };
        drop_shadow = true;
        shadow_range = 12;
        shadow_offset = "3 3";
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };
    };

  };
}
