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
  "comment" = {fg = red;};
  "constant" = {fg = blue;};
  "constant.character.escape" = {fg = yellow;};
  "function" = {fg = orange;};
  "keyword" = {fg = purple;};
  "operator" = {fg = cyan;};
  "punctuation" = {fg = green;};
  "string" = {fg = pink;};
  "string.regexp" = {fg = blue;};
  "tag" = {fg = yellow;};
  "type" = {
    fg = red;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = green;
    modifiers = ["italic"];
  };
  "variable" = {fg = purple;};
  "variable.builtin" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = yellow;};
  "variable.other.member" = {fg = red;};
  "label" = {fg = pink;};
  "punctuation.delimiter" = {fg = cyan;};
  "punctuation.bracket" = {fg = purple;};
  "keyword.directive" = {fg = orange;};
  "function.builtin" = {fg = green;};
  "function.macro" = {fg = pink;};
  "namespace" = {fg = cyan;};
  "attribute" = {fg = red;};
  "constructor" = {fg = blue;};
  "module" = {fg = yellow;};
  "special" = {fg = orange;};

  "diff.plus" = {fg = pink;};
  "diff.delta" = {fg = cyan;};
  "diff.minus" = {fg = orange;};

  "ui.background" = {
    fg = blue;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = red;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = green;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = pink;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = cyan;
    bg = background_dark;
  };
  "ui.debug" = {fg = yellow;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = purple;
  };
  "ui.linenr" = {fg = orange;};
  "ui.linenr.selected" = {fg = cyan;};
  "ui.menu" = {
    fg = red;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = green;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = cyan;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = green;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = orange;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = red;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = blue;
  };
  "ui.text" = {fg = purple;};
  "ui.text.focus" = {fg = yellow;};
  "ui.window" = {fg = green;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = cyan;};
  "warning" = {fg = pink;};

  "markup.heading" = {
    fg = orange;
    modifiers = ["bold"];
  };
  "markup.list" = cyan;
  "markup.bold" = {
    fg = red;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = purple;
  "markup.link.text" = green;
  "markup.quote" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = red;};
}
