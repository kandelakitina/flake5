{ config, ... }:
let
  custom = {
    # font = config.fontProfiles.monospace.family;
    font = "Ubuntu Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    darkGrey = "#${config.colorScheme.palette.base01}";
    magenta = "#${config.colorScheme.palette.base03}";
    grey = "#${config.colorScheme.palette.base04}";
    white = "#${config.colorScheme.palette.base06}";
    red = "#${config.colorScheme.palette.base08}";
    yellow = "#${config.colorScheme.palette.base09}";
    green = "#${config.colorScheme.palette.base0B}";
    cyan = "#${config.colorScheme.palette.base0C}";
    blue = "#${config.colorScheme.palette.base0D}";
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
              padding-left: 15px;
              
          }

          #workspaces button {
              color: ${custom.blue};
              padding-left:  6px;
              padding-right: 6px;
          }

          #workspaces button.empty {
              color: ${custom.grey};
          }

          #workspaces button.active {
              color: ${custom.magenta};
          }

          #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock, #battery {
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
              color: ${custom.blue};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-power {
              color: ${custom.blue};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-brightness {
              color: ${custom.magenta};
              padding-left: 10px;
              padding-right: 15px;
          }
          #custom-temperature {
              color: ${custom.yellow};
              padding-left: 10px;
              padding-right: 15px;
          }

      #language {
          padding-left: 10px;
          padding-right: 15px;
      }
    '';
}
