{ config, pkgs, ... }:
let
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
  # # DOES NOT WORK
  # xdg.mimeApps = {
  #   associations.added = { "x-scheme-handler/terminal" = "alacritty.desktop"; };
  #   defaultApplications = {
  #     "x-scheme-handler/terminal" = "alacritty.desktop";
  #   };
  # };

  programs.alacritty = {
    enable = true;
    settings = {
      env = { TERM = "xterm-256color"; };

      mouse.bindings = [{
        mouse = "Right";
        action = "Paste";
      }];

      font = {
        # normal = { family = "UbuntuMono Nerd Font"; };
        normal = { family = config.fontProfiles.monospace.family; };
        size = 14;
      };

      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      shell = { program = "fish"; };

      colors = {
        primary = {
          background = background;
          foreground = white;
        };
        normal = {
          black = grey;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = cyan;
          white = white;
        };
        bright = {
          black = grey;
          red = red;
          green = green;
          yellow = yellow;
          blue = blue;
          magenta = purple;
          cyan = cyan;
          white = white;
        };
      };
    };
  };
}
