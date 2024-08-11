{ config, ... }:
let
  custom = {
    font = config.fontProfiles.monospace.family;
    font_size = "15px";
    font_weight = "bold";
    white = "#${config.colorScheme.palette.base06}";
    magenta = "#${config.colorScheme.palette.base03}";
    blue = "#${config.colorScheme.palette.base0D}";
    green = "#${config.colorScheme.palette.base0B}";
    grey = "#${config.colorScheme.palette.base01}";
    yellow = "#${config.colorScheme.palette.base09}";
    cyan = "#${config.colorScheme.palette.base0C}";
    opacity = "1";
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
              text-shadow:
                  -1px -1px 0 #000,
                  1px -1px 0 #000,
                  -1px 1px 0 #000,
                  1px 1px 0 #000;
          }

          window#waybar {
              background: none;
              /* background-color: transparent; */
              /* background: rgba(128, 128, 128, 0.05); */
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
              color: ${custom.white};
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
              color: ${custom.cyan};
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
              font-size: ${custom.font_size};
              color: ${custom.blue};
              font-weight: ${custom.font_weight};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-power {
              font-size: ${custom.font_size};
              color: ${custom.blue};
              font-weight: ${custom.font_weight};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-brightness {
              font-size: ${custom.font_size};
              color: ${custom.magenta};
              font-weight: ${custom.font_weight};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-temperature {
              font-size: ${custom.font_size};
              color: ${custom.yellow};
              font-weight: ${custom.font_weight};
              padding-left: 10px;
              padding-right: 15px;
          }

      #language {
          font-size: ${custom.font_size};
          font-weight: ${custom.font_weight};
          padding-left: 10px;
          padding-right: 15px;
      }
    '';
}
