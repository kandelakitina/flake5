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
  "comment" = {fg = yellow;};
  "constant" = {fg = green;};
  "constant.character.escape" = {fg = orange;};
  "function" = {fg = blue;};
  "keyword" = {fg = cyan;};
  "operator" = {fg = purple;};
  "punctuation" = {fg = red;};
  "string" = {fg = pink;};
  "string.regexp" = {fg = yellow;};
  "tag" = {fg = green;};
  "type" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "variable" = {fg = purple;};
  "variable.builtin" = {
    fg = red;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = cyan;};
  "variable.other.member" = {fg = green;};
  "label" = {fg = yellow;};
  "punctuation.delimiter" = {fg = blue;};
  "punctuation.bracket" = {fg = orange;};
  "keyword.directive" = {fg = purple;};
  "function.builtin" = {fg = green;};
  "function.macro" = {fg = pink;};
  "namespace" = {fg = red;};
  "attribute" = {fg = cyan;};
  "constructor" = {fg = blue;};
  "module" = {fg = orange;};
  "special" = {fg = pink;};

  "diff.plus" = {fg = red;};
  "diff.delta" = {fg = cyan;};
  "diff.minus" = {fg = blue;};

  "ui.background" = {
    fg = purple;
    bg = background;
  };
  "ui.cursor" = {
    fg = background_dark;
    bg = green;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = orange;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background;
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
    bg = green;
  };
  "ui.linenr" = {fg = red;};
  "ui.linenr.selected" = {fg = blue;};
  "ui.menu" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = green;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = red;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = cyan;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = orange;
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
    bg = yellow;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = blue;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = red;
  };
  "ui.text" = {fg = orange;};
  "ui.text.focus" = {fg = green;};
  "ui.window" = {fg = purple;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = pink;};
  "warning" = {fg = orange;};

  "markup.heading" = {
    fg = blue;
    modifiers = ["bold"];
  };
  "markup.list" = red;
  "markup.bold" = {
    fg = cyan;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = purple;
  "markup.link.text" = green;
  "markup.quote" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = cyan;};
}
