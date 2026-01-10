{ config, pkgs, lib, ... }: {
  imports = [
    ./bindings.nix
    ./dunst.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./pyprland.nix
    # ./swayidle.nix
    # ./swaylock.nix
    ./waybar
    ./windowrules.nix
    ./wofi.nix
  ];

  home = {
    packages = with pkgs; [
      pamixer
      hyprpicker
      cliphist
      # wlsunset
      brightnessctl
      networkmanagerapplet
      swayidle
      # swaylock
      wl-gammarelay-rs
      pyprland
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
      active = "0xaa${lib.removePrefix "#" config.colorScheme.palette.base05}";
      inactive =
        "0xaa${lib.removePrefix "#" config.colorScheme.palette.base00}";
    in {
      end = [
        # Cursor size
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"

        # Cursor theme
        "XCURSOR_THEME,Adwaita"
        "HYPRCURSOR_THEME,Adwaita"

        # Force all apps to use Wayland
        "GDK_BACKEND,wayland"
        "QT_QPA_PLATFORM,wayland"
        "QT_STYLE_OVERRIDE,kvantum"
        "SDL_VIDEODRIVER,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "OZONE_PLATFORM,wayland"
      ];
      monitor = [
        "desc: BNQ BenQ GW2750H 4AD04227SL0, 1920x1080@60, 0x0, 1"
        "desc: LG Electronics LG TV SSCR2 0x01010101, 3840x2160@120, 0x0, 2"
      ];
      # monitor = [ "HDMI-A-2,disable" "HDMI-A-1,preferred,auto,1" ];
      ecosystem = { no_update_news = true; };

      exec-once = [
        "${pkgs.waybar}/bin/waybar &"
        "${pkgs.dunst}/bin/dunst &"
        "nm-applet &"
        # "${pkgs.wlsunset}/bin/wlsunset -l 44.56 -L 38.09"
        "wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
        "wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"
        # "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
        "${pkgs.swaybg}/bin/swaybg -i ~/Pictures/wallpapers/wallpaper --mode fill"
        "${pkgs.yubikey-touch-detector}/bin/yubikey-touch-detector" # # -libnotify
        "${pkgs.blueman}/bin/blueman-applet &"
        "${pkgs.bluez}/bin/bluetoothctl power on" # Ensures Bluetooth is turned on
        "${pkgs.pyprland}/bin/pypr"
      ];
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
        sensitivity = 0;
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
        on_focus_under_fullscreen = 1;
        # new_window_takes_over_fullscreen = 2; # deprecated
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
        shadow = {
          enabled = true;
          range = 12;
          color = "0x44000000";
          color_inactive = "0x66000000";
          offset = "3 3";
        };
      };

      layerrule = [
        "animation fade, match:namespace ^(waybar)$"
        "blur on, match:namespace ^(waybar)$"
        "ignore_alpha 0, match:namespace ^(waybar)$"
        "blur on, match:namespace ^(notifications)$"
        "ignore_alpha 0, match:namespace ^(notifications)$"
        "blur on, match:namespace ^(wofi)$"
        "ignore_alpha 0, match:namespace ^(wofi)$"
        "no_anim on, match:namespace ^(wallpaper)$"
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
