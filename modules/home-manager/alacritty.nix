{
  config,
  lib,
  pkgs,
  ...
}: let
  background = "#${config.colorScheme.palette.base00}";
  purple = "#${config.colorScheme.palette.base03}";
  grey = "#${config.colorScheme.palette.base04}";
  white = "#${config.colorScheme.palette.base05}";
  red = "#${config.colorScheme.palette.base08}";
  yellow = "#${config.colorScheme.palette.base09}";
  green = "#${config.colorScheme.palette.base0B}";
  cyan = "#${config.colorScheme.palette.base0C}";
  blue = "#${config.colorScheme.palette.base0D}";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };

      mouse.bindings = [
        {
          mouse = "Right";
          action = "Paste";
        }
      ];

      font = {
        normal = {
          family = "UbuntuMono Nerd Font";
        };
        size = 18;
      };

      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      shell = {
        program = "fish";
      };

      colors = {
        primary = {
          background = background;
          foreground = white;
          dim_foreground = grey;
          bright_foreground = white;
        };
        cursor = {
          text = background;
          cursor = white;
        };
        vi_mode_cursor = {
          text = background;
          cursor = white;
        };
        search = {
          matches = {
            foreground = background;
            background = blue;
          };
          focused_match = {
            foreground = background;
            background = green;
          };
        };
        hints = {
          start = {
            foreground = background;
            background = yellow;
          };
          end = {
            foreground = background;
            background = blue;
          };
        };
        selection = {
          text = background;
          background = white;
        };
        normal = {
          black = background;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = cyan;
          white = white;
        };
        bright = {
          black = background;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = cyan;
          white = white;
        };
        dim = {
          black = background;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = cyan;
          white = grey;
        };
        indexed_colors = [
          {
            index = 16;
            color = yellow;
          }
          {
            index = 17;
            color = white;
          }
        ];
      };
    };
  };
}
