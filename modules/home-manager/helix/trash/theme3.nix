{ colorScheme }: let
  # Define color variables
  red = "base09";
  orange = "base0A";
  yellow = "base0B";
  green = "base0C";
  blue = "base0D";
  purple = "base0E";
  pink = "base0F";
  black = "base00";
  darkGrey = "base01";
  lightGrey = "base02";
  white = "base05"; # Assuming white or a light color
  commentColor = "base03";
  foreground = "base04";
  background = "base00";
  backgroundDark = "base01";

in {
  "nix-${colorScheme.slug}" = {
    palette = builtins.mapAttrs (name: value: "#${value}") colorScheme.palette;
    "attributes" = red;
    "comment" = {
      fg = commentColor;
      modifiers = ["italic"];
    };
    # Use the color variables in your configuration
    "constant" = red;
    "constant.character.escape" = green;
    "constant.numeric" = red;
    "constructor" = blue;
    "debug" = commentColor;
    "diagnostic" = { modifiers = ["underlined"]; };
    "diagnostic.error" = { underline = { style = "curl"; }; };
    "diagnostic.hint" = { underline = { style = "curl"; }; };
    "diagnostic.info" = { underline = { style = "curl"; }; };
    "diagnostic.warning" = { underline = { style = "curl"; }; };
    "diff.delta" = red;
    "diff.minus" = blue;
    "diff.plus" = yellow;
    "error" = purple;
    "function" = blue;
    "hint" = commentColor;
    "info" = blue;
    "keyword" = purple;
    "label" = purple;
    "markup.bold" = { fg = orange; modifiers = ["bold"]; };
    "markup.heading" = blue;
    "markup.italic" = { fg = purple; modifiers = ["italic"]; };
    "markup.link.text" = purple;
    "markup.link.url" = { fg = red; modifiers = ["underlined"]; };
    "markup.list" = purple;
    "markup.quote" = green;
    "markup.raw" = yellow;
    "markup.strikethrough" = { modifiers = ["crossed_out"]; };
    "namespace" = purple;
    "operator" = white;
    "special" = blue;
    "string" = yellow;
    "type" = orange;
    "ui.background" = { bg = background; };
    "ui.bufferline" = { fg = commentColor; bg = background; };
    "ui.bufferline.active" = { fg = white; bg = lightGrey; modifiers = ["bold"]; };
    "ui.cursor" = { fg = foreground; modifiers = ["reversed"]; };
    "ui.cursor.insert" = { fg = orange; modifiers = ["underlined"]; };
    "ui.cursor.match" = { fg = orange; modifiers = ["underlined"]; };
    "ui.cursor.select" = { fg = orange; modifiers = ["underlined"]; };
    "ui.cursorline.primary" = { fg = white; bg = darkGrey; };
    "ui.gutter" = { bg = background; };
    "ui.help" = { fg = lightGrey; bg = darkGrey; };
    "ui.linenr" = { fg = commentColor; bg = background; };
    "ui.linenr.selected" = { fg = foreground; bg = darkGrey; modifiers = ["bold"]; };
    "ui.menu" = { fg = white; bg = darkGrey; };
    "ui.menu.scroll" = { fg = commentColor; bg = darkGrey; };
    "ui.menu.selected" = { fg = darkGrey; bg = foreground; };
    "ui.popup" = { bg = darkGrey; };
    "ui.selection" = { bg = lightGrey; };
    "ui.selection.primary" = { bg = lightGrey; };
    "ui.statusline" = { fg = foreground; bg = darkGrey; };
    "ui.statusline.inactive" = { fg = lightGrey; bg = darkGrey; };
    "ui.statusline.insert" = { fg = background; bg = yellow; };
    "ui.statusline.normal" = { fg = background; bg = blue; };
    "ui.statusline.select" = { fg = background; bg = purple; };
    "ui.text" = white;
    "ui.text.focus" = white;
    "ui.virtual.indent-guide" = { fg = commentColor; };
    "ui.virtual.ruler" = { bg = darkGrey; };
    "ui.virtual.whitespace" = { fg = darkGrey; };
    "ui.window" = { bg = darkGrey; };
    "variable" = white;
    "variable.other.member" = purple;
    "warning" = red;
  };
}

