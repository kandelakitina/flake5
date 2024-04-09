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
  "comment" = {fg = green;};
  "constant" = {fg = red;};
  "constant.character.escape" = {fg = cyan;};
  "function" = {fg = blue;};
  "keyword" = {fg = orange;};
  "operator" = {fg = pink;};
  "punctuation" = {fg = purple;};
  "string" = {fg = yellow;};
  "string.regexp" = {fg = red;};
  "tag" = {fg = cyan;};
  "type" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "variable" = {fg = blue;};
  "variable.builtin" = {
    fg = green;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = orange;};
  "variable.other.member" = {fg = cyan;};
  "label" = {fg = yellow;};
  "punctuation.delimiter" = {fg = red;};
  "punctuation.bracket" = {fg = pink;};
  "keyword.directive" = {fg = purple;};
  "function.builtin" = {fg = orange;};
  "function.macro" = {fg = green;};
  "namespace" = {fg = yellow;};
  "attribute" = {fg = pink;};
  "constructor" = {fg = cyan;};
  "module" = {fg = purple;};
  "special" = {fg = blue;};

  "diff.plus" = {fg = cyan;};
  "diff.delta" = {fg = pink;};
  "diff.minus" = {fg = yellow;};

  "ui.background" = {
    fg = red;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = cyan;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = purple;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = yellow;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.debug" = {fg = orange;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = blue;
  };
  "ui.linenr" = {fg = purple;};
  "ui.linenr.selected" = {fg = yellow;};
  "ui.menu" = {
    fg = cyan;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = orange;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = green;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = red;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = purple;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = red;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = green;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = orange;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = cyan;
  };
  "ui.text" = {fg = yellow;};
  "ui.text.focus" = {fg = pink;};
  "ui.window" = {fg = blue;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = purple;};
  "warning" = {fg = cyan;};

  "markup.heading" = {
    fg = red;
    modifiers = ["bold"];
  };
  "markup.list" = blue;
  "markup.bold" = {
    fg = cyan;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = orange;
  "markup.link.text" = green;
  "markup.quote" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = cyan;};
}
