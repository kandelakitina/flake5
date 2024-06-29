{ config, pkgs, lib, ... }: {
  imports = [
    ./waybar
    ./wofi.nix
    ./bindings.nix
    ./swayidle.nix
    ./swaylock.nix
    ./mako.nix
  ];
  home = {
    packages = with pkgs; [
      pamixer
      hyprpicker
      cliphist
      wlsunset
      brightnessctl
      networkmanagerapplet
      swayidle
    ];
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
        "${pkgs.mako}/bin/mako &"
        "nm-applet &"
        "${pkgs.wlsunset}/bin/wlsunset -l 44.56 -L 38.09"
        "wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
        "wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"
        "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
      ];
      monitor = [ ",preferred,auto,auto" "eDP-1,preferred,auto,1" ];
      # cursor = { inactive_timeout = 4; };
      general = {
        resize_on_border = true;
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

      layerrule = [
        "animation fade,waybar"
        "blur,waybar"
        "ignorezero,waybar"
        "blur,notifications"
        "ignorezero,notifications"
        "blur,wofi"
        "ignorezero,wofi"
        "noanim,wallpaper"
      ];

      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinout,0.45, 0, 0.55, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
          "easeinoutback,0.68, -0.6, 0.32, 1.6"
        ];

        animation = [
          "border,1,3,easeout"
          "workspaces,1,2,easeoutback,slide"
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeinout"
          "fadeShadow,1,3,easeinout"
          "fadeDim,1,3,easeinout"
          "fadeLayersIn,1,3,easeoutback"
          "fadeLayersOut,1,3,easeinback"
          "layersIn,1,3,easeoutback,slide"
          "layersOut,1,3,easeinback,slide"
        ];
      };

    };

  };
}
