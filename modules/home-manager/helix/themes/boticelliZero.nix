{colorScheme}: let
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
  "attribute" = {fg = yellow;};
  "comment" = {
    fg = purple;
    modifiers = ["italic" "dim"];
  };
  "constant.character.escape" = {fg = purple;};
  "constant" = {fg = yellow;};
  "constant.numeric" = {fg = blue;};
  "constructor" = {fg = purple;};
  "diff.delta" = {fg = cyan;};
  "diff.minus" = {fg = red;};
  "diff.plus" = {fg = green;};
  "error" = {fg = red;};
  "function.builtin" = {fg = yellow;};
  "function" = {fg = yellow;};
  "function.macro" = {fg = green;};
  "keyword.directive" = {fg = yellow;};
  "keyword" = {fg = purple;};
  "label" = {fg = red;};
  "markup.bold" = {
    fg = white;
    modifiers = ["bold"];
  };
  "markup.heading" = {
    fg = blue;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "markup.link.text" = {fg = purple;};
  "markup.link.url" = {fg = yellow;};
  "markup.list" = {fg = yellow;};
  "markup.quote" = {
    fg = white;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = blue;};
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "module" = {fg = purple;};
  "namespace" = {fg = yellow;};
  "operator" = {fg = red;};

  "punctuation.bracket" = {fg = purple;};
  "punctuation.delimiter" = {fg = yellow;};
  "punctuation" = {fg = yellow;};

  "special" = {fg = red;};
  "string" = {fg = green;};
  "string.regexp" = {fg = red;};
  "tag" = {fg = cyan;};
  "type.enum.variant" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "type" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "ui.background" = {
    fg = yellow;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = yellow;
    modifiers = ["dim"];
  };
  "ui.cursorline" = {
    bg = darkGrey;
  };
  "ui.cursor.match" = {
    fg = green;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background;
    bg = red;
    modifiers = ["dim"];
  };
  "ui.debug" = {fg = red;};
  "ui.help" = {
    fg = blue;
    bg = background;
  };
  "ui.highlight.frameline" = {
    fg = grey;
    bg = red;
  };
  "ui.linenr" = {fg = blue;};
  "ui.linenr.selected" = {fg = blue;};
  "ui.menu" = {
    fg = purple;
    bg = background;
  };
  "ui.menu.selected" = {
    fg = yellow;
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
    fg = purple;
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
  "ui.text" = {fg = blue;};
  "ui.text.focus" = {fg = white;};
  "ui.window" = {fg = blue;};
  "variable.builtin" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "variable" = {fg = blue;};
  "variable.other.member" = {fg = white;};
  "variable.parameter" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "warning" = {fg = yellow;};
}
