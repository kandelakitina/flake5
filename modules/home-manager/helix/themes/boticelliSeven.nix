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
  "comment" = {fg = blue;};
  "constant" = {fg = green;};
  "constant.character.escape" = {fg = orange;};
  "function" = {fg = purple;};
  "keyword" = {fg = cyan;};
  "operator" = {fg = pink;};
  "punctuation" = {fg = red;};
  "string" = {fg = yellow;};
  "string.regexp" = {fg = orange;};
  "tag" = {fg = purple;};
  "type" = {
    fg = green;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "variable" = {fg = cyan;};
  "variable.builtin" = {
    fg = red;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = pink;};
  "variable.other.member" = {fg = yellow;};
  "label" = {fg = cyan;};
  "punctuation.delimiter" = {fg = blue;};
  "punctuation.bracket" = {fg = green;};
  "keyword.directive" = {fg = red;};
  "function.builtin" = {fg = pink;};
  "function.macro" = {fg = yellow;};
  "namespace" = {fg = orange;};
  "attribute" = {fg = blue;};
  "constructor" = {fg = cyan;};
  "module" = {fg = purple;};
  "special" = {fg = red;};

  "diff.plus" = {fg = green;};
  "diff.delta" = {fg = orange;};
  "diff.minus" = {fg = pink;};

  "ui.background" = {
    fg = cyan;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = green;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = purple;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = red;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.debug" = {fg = blue;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = cyan;
  };
  "ui.linenr" = {fg = red;};
  "ui.linenr.selected" = {fg = green;};
  "ui.menu" = {
    fg = purple;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = red;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = blue;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = yellow;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = cyan;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = orange;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = blue;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = green;
  };
  "ui.text" = {fg = orange;};
  "ui.text.focus" = {fg = red;};
  "ui.window" = {fg = cyan;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = red;};
  "warning" = {fg = yellow;};

  "markup.heading" = {
    fg = cyan;
    modifiers = ["bold"];
  };
  "markup.list" = green;
  "markup.bold" = {
    fg = orange;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = blue;
  "markup.link.text" = pink;
  "markup.quote" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = green;};
}
