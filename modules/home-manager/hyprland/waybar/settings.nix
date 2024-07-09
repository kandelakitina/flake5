{ config, ... }: {
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [ "custom/launcher" "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [
      "tray"
      "cpu"
      "memory"
      "disk"
      "pulseaudio"
      "battery"
      # "network"
      # "custom/gamma"
      "custom/brightness"
      "custom/temperature"
      "hyprland/language"
      "custom/power"
    ];
    "hyprland/language" = {
      format = "{}";
      format-ru =
        # "<span foreground='#${config.colorScheme.palette.base08}'>русский</span>";
        "<span foreground='#${config.colorScheme.palette.base08}'>русский</span>";
      format-en =
        "<span foreground='#${config.colorScheme.palette.base0B}'>english</span>";
    };
    "custom/temperature" = {
      format = "{} ";
      exec = "wl-gammarelay-rs watch {t}";
      on-scroll-up =
        "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +100";
      on-scroll-down =
        "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -100";
      on-click =
        "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
    };
    "custom/brightness" = {
      format = "{}% ";
      exec = "wl-gammarelay-rs watch {bp}";
      on-scroll-up =
        "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d +0.02";
      on-scroll-down =
        "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d -0.02";
      on-click =
        "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d 1";
    };
    # "custom/gamma" = {
    #   format = "{}% γ";
    #   exec = "wl-gammarelay-rs watch {g}";
    #   on-scroll-up =
    #     "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateGamma d +0.02";
    #   on-scroll-down =
    #     "busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateGamma d -0.02";
    #   on-click =
    #     "busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Gamma d 1";
    # };
    clock = {
      calendar = {
        format = { today = "<span color='#b4befe'><b><u>{}</u></b></span>"; };
      };
      format = "{:%H:%M %d/%m}";
      tooltip = "true";
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
      format-alt = " {:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "󰈹";
        "2" = "";
        "3" = "󰘙";
        "4" = "";
        "5" = "";
        "6" = "";
        urgent = "";
        default = "";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };
    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };
    cpu = {
      format = " {usage:2}%";
      format-alt = " {avg_frequency} GHz";
      interval = 2;
    };
    disk = {
      # path = "/";
      format = "󰋊 {percentage_used:2}%";
      interval = 60;
    };
    # network = {
    #   format-wifi = "  {signalStrength:2}%";
    #   format-ethernet = "󰀂 ";
    #   tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
    #   format-linked = "{ifname} (No IP)";
    #   format-disconnected = "󰖪 ";
    # };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "󰖁  {volume}%";
      format-icons = { default = [ " " ]; };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [ " " " " " " " " " " ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = { warning = 20; };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "custom/launcher" = {
      format = "";
      on-click = "pkill wofi || wofi --show drun";
      on-click-right = "pkill wofi || wallpaper-picker";
      tooltip = "false";
    };
    "custom/power" = {
      format = "⏻";
      on-click = "pkill wofi || shutdown-script";
      tooltip = "false";
    };
  };
}
