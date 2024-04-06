{colorScheme}: let
  backgroundDeepBlue = "#${colorScheme.palette.base00}"; # Deep Blue (background)
  black = "#${colorScheme.palette.base01}"; # Black
  lightBlack = "#${colorScheme.palette.base02}"; # Light Black
  magenta = "#${colorScheme.palette.base03}"; # Magenta (purple)
  lightMagenta = "#${colorScheme.palette.base07}"; # Light Magenta (purple)
  foregroundOffWhite = "#${colorScheme.palette.base04}"; # Off White (foreground)
  pureWhite = "#${colorScheme.palette.base05}"; # White (pure)
  defaultWhite = "#${colorScheme.palette.base06}"; # White (default)
  red = "#${colorScheme.palette.base08}"; # Red
  yellow = "#${colorScheme.palette.base09}"; # Yellow
  lightYellow = "#${colorScheme.palette.base0A}"; # Light Yellow
  green = "#${colorScheme.palette.base0B}"; # Green
  cyan = "#${colorScheme.palette.base0C}"; # Cyan
  blue = "#${colorScheme.palette.base0D}"; # Blue
  lightRed = "#${colorScheme.palette.base0E}"; # Light Red
  lightBlue = "#${colorScheme.palette.base0F}"; # Light Blue
in {
  "nix-${colorScheme.slug}" = {
    fg = lightBlack; # Buttons' colors
    red = yellow; # Keybinds on buttons
    black = backgroundDeepBlue; # Bars background and "LOCK" etc
    green = magenta; # Panes' borders, tabs button, secondary keys in Tips
    bg = magenta; # ???
    yellow = yellow; 
    blue = blue;
    magenta = magenta;
    cyan = red;
    white = lightBlack;
    orange = yellow;
  };
}
