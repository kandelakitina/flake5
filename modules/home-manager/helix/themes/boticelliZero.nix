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
  "attribute" = { fg = yellow; };
  "comment" = {
    fg = grey;
    modifiers = [ "italic" "dim" ];
  };
  "constant.character.escape" = { fg = purple; };
  "constant" = { fg = yellow; };
  "constant.numeric" = { fg = blue; };
  "constructor" = { fg = purple; };
  "diff.delta" = { fg = cyan; };
  "diff.minus" = { fg = red; };
  "diff.plus" = { fg = green; };
  "error" = { fg = red; };
  "function.builtin" = { fg = yellow; };
  "function" = { fg = yellow; };
  "function.macro" = { fg = green; };
  "keyword.directive" = { fg = yellow; };
  "keyword" = { fg = purple; };
  "label" = { fg = red; };

  "diagnostic.hint" = {
    underline = {
      color = cyan;
      style = "curl";
    };
  };
  "diagnostic.info" = {
    underline = {
      color = purple;
      style = "curl";
    };
  };
  "diagnostic.warning" = {
    underline = {
      color = yellow;
      style = "curl";
    };
  };
  "diagnostic.error" = {
    underline = {
      color = red;
      style = "curl";
    };
  };

  # Markup
  "markup.heading.marker" = grey;
  "markup.heading.1" = {
    fg = red;
    modifiers = [ "bold" ];
  };
  "markup.heading.2" = {
    fg = yellow;
    modifiers = [ "bold" ];
  };
  "markup.heading.3" = {
    fg = purple;
    modifiers = [ "bold" ];
  };
  "markup.heading.4" = {
    fg = cyan;
    modifiers = [ "bold" ];
  };
  "markup.heading.5" = {
    fg = green;
    modifiers = [ "bold" ];
  };
  "markup.heading.6" = {
    fg = blue;
    modifiers = [ "bold" ];
  };
  "markup.list" = purple;
  "markup.bold" = {
    fg = cyan;
    modifiers = [ "bold" ];
  };
  "markup.italic" = {
    fg = purple;
    modifiers = [ "italic" ];
  };
  "markup.link.url" = {
    fg = blue;
    modifiers = [ "underlined" ];
  };
  "markup.link.label" = {
    fg = cyan;
    modifiers = [ "underlined" ];
  };
  "markup.link.text" = purple;
  "markup.quote" = green;
  "markup.raw.block" = {
    fg = blue;
    bg = darkGrey;
  };
  "markup.raw.inline" = { fg = blue; };

  "module" = { fg = purple; };
  "namespace" = { fg = yellow; };
  "operator" = { fg = red; };

  "punctuation.bracket" = { fg = purple; };
  "punctuation.delimiter" = { fg = yellow; };
  "punctuation" = { fg = yellow; };

  "special" = { fg = red; };
  "string" = { fg = green; };
  "string.regexp" = { fg = red; };
  "tag" = { fg = cyan; };
  "type.enum.variant" = {
    fg = cyan;
    modifiers = [ "italic" ];
  };
  "type" = {
    fg = purple;
    modifiers = [ "italic" ];
  };
  "ui.background" = {
    fg = white;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = white;
    modifiers = [ "dim" ];
  };
  "ui.cursorline" = { bg = darkGrey; };
  "ui.cursor.match" = {
    fg = green;
    modifiers = [ "underlined" ];
  };
  "ui.cursor.primary" = {
    fg = background;
    bg = red;
    modifiers = [ "dim" ];
  };
  "ui.debug" = { fg = red; };
  "ui.help" = {
    fg = blue;
    bg = background;
  };
  "ui.highlight.frameline" = {
    fg = grey;
    bg = red;
  };
  "ui.linenr" = { fg = blue; };
  "ui.linenr.selected" = { fg = blue; };
  "ui.menu" = {
    fg = blue;
    bg = background;
  };
  "ui.menu.selected" = {
    fg = white;
    bg = background;
  };
  "ui.popup" = {
    fg = blue;
    bg = background;
  };
  "ui.selection" = {
    fg = background;
    bg = purple;
    # modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background;
    bg = purple;
  };
  "ui.statusline" = {
    fg = blue;
    bg = darkGrey;
  };
  "ui.statusline.inactive" = {
    fg = grey;
    bg = background;
  };
  "ui.statusline.insert" = {
    fg = background;
    bg = red;
  };
  "ui.statusline.normal" = {
    fg = blue;
    bg = background;
  };
  "ui.statusline.select" = {
    fg = white;
    bg = purple;
  };
  "ui.text" = { fg = white; };
  "ui.text.focus" = { fg = white; };
  "ui.virtual.jump-label" = {
    fg = red;
    # bg = yellow;
  };
  "ui.virtual.indent-guide" = { fg = grey; };
  "ui.virtual.inlay-hint" = { fg = grey; };
  "ui.window" = { fg = blue; };
  "variable.builtin" = {
    fg = cyan;
    modifiers = [ "italic" ];
  };
  "variable" = { fg = blue; };
  "variable.other.member" = { fg = white; };
  "variable.parameter" = {
    fg = yellow;
    modifiers = [ "italic" ];
  };
  "warning" = { fg = yellow; };
}
