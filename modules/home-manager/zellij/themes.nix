{ colorScheme }:
let
  background = "#${colorScheme.palette.base00}";
  darkGrey = "#${colorScheme.palette.base01}";
  purple = "#${colorScheme.palette.base03}";
  grey = "#${colorScheme.palette.base04}";
  white = "#${colorScheme.palette.base05}";
  red = "#${colorScheme.palette.base08}";
  yellow = "#${colorScheme.palette.base09}";
  green = "#${colorScheme.palette.base0B}";
  cyan = "#${colorScheme.palette.base0C}";
  blue = "#${colorScheme.palette.base0D}";
in {
  "nix-${colorScheme.slug}" = {
    fg = grey; # Buttons' colors
    red = yellow; # Keybinds on buttons
    black = background; # Bars background and "LOCK" etc
    green = green; # Panes' borders, tabs button, secondary keys in Tips
    bg = purple; # ???
    yellow = yellow;
    blue = blue;
    magenta = purple;
    cyan = red;
    white = grey;
    orange = yellow;
  };
}
