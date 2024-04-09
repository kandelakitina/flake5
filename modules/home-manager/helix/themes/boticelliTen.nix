{colorScheme}: let
  background = "#${colorScheme.palette.base00}";
  background_dark = "#${colorScheme.palette.base01}";
  purple = "#${colorScheme.palette.base03}";
  foreground = "#${colorScheme.palette.base04}";
  red = "#${colorScheme.palette.base08}";
  orange = "#${colorScheme.palette.base09}";
  yellow = "#${colorScheme.palette.base0A}";
  green = "#${colorScheme.palette.base0B}";
  cyan = "#${colorScheme.palette.base0C}";
  pink = "#${colorScheme.palette.base07}";
  black = "#${colorScheme.palette.base00}";
  blue = "#${colorScheme.palette.base0D}";
in {
  "comment" = {fg = cyan;};
  "constant" = {fg = blue;};
  "constant.character.escape" = {fg = yellow;};
  "function" = {fg = purple;};
  "keyword" = {fg = orange;};
  "operator" = {fg = red;};
  "punctuation" = {fg = pink;};
  "string" = {fg = green;};
  "string.regexp" = {fg = blue;};
  "tag" = {fg = orange;};
  "type" = {
    fg = red;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "variable" = {fg = cyan;};
  "variable.builtin" = {
    fg = green;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = pink;};
  "variable.other.member" = {fg = orange;};
  "label" = {fg = purple;};
  "punctuation.delimiter" = {fg = red;};
  "punctuation.bracket" = {fg = green;};
  "keyword.directive" = {fg = cyan;};
  "function.builtin" = {fg = yellow;};
  "function.macro" = {fg = red;};
  "namespace" = {fg = pink;};
  "attribute" = {fg = blue;};
  "constructor" = {fg = orange;};
  "module" = {fg = green;};
  "special" = {fg = yellow;};

  "diff.plus" = {fg = pink;};
  "diff.delta" = {fg = purple;};
  "diff.minus" = {fg = cyan;};

  "ui.background" = {
    fg = green;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = red;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = pink;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = blue;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.debug" = {fg = cyan;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = orange;
  };
  "ui.linenr" = {fg = purple;};
  "ui.linenr.selected" = {fg = red;};
  "ui.menu" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = red;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = green;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = yellow;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = cyan;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = green;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = yellow;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = orange;
  };
  "ui.text" = {fg = purple;};
  "ui.text.focus" = {fg = red;};
  "ui.window" = {fg = cyan;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = red;};
  "warning" = {fg = blue;};

  "markup.heading" = {
    fg = orange;
    modifiers = ["bold"];
  };
  "markup.list" = yellow;
  "markup.bold" = {
    fg = purple;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = red;
  "markup.link.text" = green;
  "markup.quote" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = pink;};
}
