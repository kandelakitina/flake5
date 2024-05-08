{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = [ "hyprland/workspaces" "hyprland/mode" ];
        modules-center = [ "hyprland/window" ];
        modules-right =
          [ "pulseaudio" "network" "cpu" "memory" "battery" "tray" "clock" ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            urgent = "";
            focused = "";
            default = "";
          };
        };
        "hyprland/mode" = { format = ''<span style="italic">{}</span>''; };
        tray = { spacing = 10; };
        clock = { format-alt = "{:%Y-%m-%d}"; };
        cpu = { format = "{usage}% "; };
        memory = { format = "{}% "; };
        battery = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          on-click = "pavucontrol";
        };
      };
      #   layer = "bottom";
      #   position = "top";
      #   height = 34;

      #   modules-left = [ "hyprland/workspaces" "mode" ];
      #   modules-center = [ "hyprland/window" ];
      #   modules-right = [
      #     "tray"
      #     "backlight"
      #     "custom/storage"
      #     "cpu"
      #     "memory"
      #     "temperature"
      #     "pulseaudio"
      #     "network"
      #     "battery"
      #     "clock"
      #   ];

      #   mode = { format = " {}"; };

      #   "hyprland/workspaces" = {
      #     all-outputs = false;
      #     # format = "{icon}";
      #     # format-icons = {
      #     #   "1" = "";
      #     #   "2" = "";
      #     #   "3" = "";
      #     #   "4" = "";
      #     #   "5" = "";
      #     #   "6" = "華";
      #     #   "10" = "ﱘ";
      #     #   "urgent" = "";
      #     #   "focused" = "";
      #     #   "default" = "";
      #     # };
      #   };

      #   "hyprland/window" = {
      #     "max-length" = 80;
      #     tooltip = false;
      #   };

      #   clock = {
      #     format = "{:%a  ·  %d.%m.%Y  ·  %H:%M}";
      #     tooltip = false;
      #   };

      #   cpu = {
      #     interval = 10;
      #     format = "{}% ";
      #     "max-length" = 10;
      #   };

      #   memory = {
      #     interval = 30;
      #     format = "{used:0.2f} / {total:0.0f} GB ";
      #     "max-length" = 10;
      #     tooltip = false;
      #   };

      #   battery = {
      #     bat = "BAT0";
      #     format = "{capacity}% {icon}";
      #     "format-alt" = "{time} {icon}";
      #     "format-icons" = [ "" "" "" "" "" ];
      #     "format-charging" = "{capacity}% ";
      #     interval = 30;
      #     states = {
      #       warning = 25;
      #       critical = 10;
      #     };
      #     tooltip = false;
      #   };

      #   temperature = {
      #     "critical-threshold" = 80;
      #     "format-critical" = "{temperatureC}° ";
      #     format = "{temperatureC}° ";
      #   };

      #   network = {
      #     format = "{icon}";
      #     "format-alt" = "{ipaddr}/{cidr} {icon}";
      #     "format-alt-click" = "click-right";
      #     "format-icons" = {
      #       wifi = [ "睊" "直" "" ];
      #       ethernet = [ "" ];
      #       disconnected = [ "" ];
      #     };
      #     "on-click" = "alacritty -e nmtui";
      #     tooltip = false;
      #   };

      #   pulseaudio = {
      #     format = "{volume}% {icon}";
      #     "format-bluetooth" = "{volume}% {icon}";
      #     "format-muted" = "";
      #     "format-icons" = {
      #       headphone = "";
      #       "hands-free" = "";
      #       headset = "";
      #       phone = "";
      #       portable = "";
      #       default = "";
      #     };
      #     "scroll-step" = 1;
      #     "on-click" = "pavucontrol";
      #     tooltip = false;
      #   };

      #   "custom/storage" = {
      #     format = "{} ";
      #     "format-alt" = "{percentage}% ";
      #     "format-alt-click" = "click-right";
      #     "return-type" = "json";
      #     interval = 60;
      #     exec = "~/.config/waybar/modules/storage.sh";
      #   };

      #   backlight = {
      #     device = "intel_backlight";
      #     format = "{percent}% {icon}";
      #     "format-alt" = "{percent}% {icon}";
      #     "format-alt-click" = "click-right";
      #     "format-icons" = [ "" "" ];
      #     "on-scroll-down" = "light -A 1";
      #     "on-scroll-up" = "light -U 1";
      #   };

      #   "custom/weather" = {
      #     format = "{}";
      #     "format-alt" = "{alt}: {}";
      #     "format-alt-click" = "click-right";
      #     interval = 1800;
      #     "return-type" = "json";
      #     exec = "~/.config/waybar/modules/weather.sh";
      #     "exec-if" = "ping wttr.in -c1";
      #   };

      #   idle_inhibitor = {
      #     format = "{icon}";
      #     "format-icons" = {
      #       activated = "";
      #       deactivated = "";
      #     };
      #     tooltip = false;
      #   };

      #   "custom/mail" = {
      #     format = "";
      #     "format-alt" = "{alt} ";
      #     "format-alt-click" = "click-right";
      #     interval = 60;
      #     "return-type" = "json";
      #     exec = "~/.config/waybar/modules/mail.py";
      #     tooltip = false;
      #   };

      #   tray = { "icon-size" = 18; };
      # };
    };
  };
}
