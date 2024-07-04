{ config, ... }:
let
  custom = {
    font = config.fontProfiles.monospace.family;
    font_size = "15px";
    font_weight = "bold";
    text_color = "#${config.colorScheme.palette.base06}";
    secondary_accent = "#${config.colorScheme.palette.base03}";
    tertiary_accent = "#${config.colorScheme.palette.base0D}";
    background = "11111B";
    opacity = "0.98";
  };
in {
  programs.waybar.style = # css
    ''

      * {
          border: none;
          border-radius: 0px;
          padding: 0;
          margin: 0;
          min-height: 0px;
          font-family: ${custom.font};
          font-weight: ${custom.font_weight};
          opacity: ${custom.opacity};
      }

      window#waybar {
          background: none;
      }

      #workspaces {
          font-size: 18px;
          padding-left: 15px;
          
      }
      #workspaces button {
          color: #${config.colorScheme.palette.base0D};
          padding-left:  6px;
          padding-right: 6px;
      }
      #workspaces button.empty {
          color: #${config.colorScheme.palette.base04};
      }
      #workspaces button.active {
          color: #${config.colorScheme.palette.base08};
      }

      #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock, #battery {
          font-size: ${custom.font_size};
          color: ${custom.text_color};
      }

      #cpu {
          padding-left: 15px;
          padding-right: 9px;
          margin-left: 7px;
      }
      #memory {
          padding-left: 9px;
          padding-right: 9px;
      }
      #disk {
          padding-left: 9px;
          padding-right: 15px;
      }

      #tray {
          padding: 0 20px;
          margin-left: 7px;
      }

      #pulseaudio {
          padding-left: 15px;
          padding-right: 9px;
          margin-left: 7px;
          color: #${config.colorScheme.palette.base09};
      }
      #battery {
          padding-left: 9px;
          padding-right: 9px;
      }
      #network {
          padding-left: 9px;
          padding-right: 15px;
      }

      #clock {
          padding-left: 9px;
          padding-right: 15px;
      }

      #custom-launcher {
          font-size: 20px;
          color: ${custom.tertiary_accent};
          font-weight: ${custom.font_weight};
          padding-left: 10px;
          padding-right: 15px;
      }
      #custom-power {
          font-size: 20px;
          color: ${custom.tertiary_accent};
          font-weight: ${custom.font_weight};
          padding-left: 10px;
          padding-right: 15px;
      }
    '';
}
