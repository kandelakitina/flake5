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
  "comment" = {fg = pink;};
  "constant" = {fg = cyan;};
  "constant.character.escape" = {fg = green;};
  "function" = {fg = yellow;};
  "keyword" = {fg = red;};
  "operator" = {fg = blue;};
  "punctuation" = {fg = orange;};
  "string" = {fg = purple;};
  "string.regexp" = {fg = cyan;};
  "tag" = {fg = yellow;};
  "type" = {
    fg = pink;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = red;
    modifiers = ["italic"];
  };
  "variable" = {fg = green;};
  "variable.builtin" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = blue;};
  "variable.other.member" = {fg = red;};
  "label" = {fg = yellow;};
  "punctuation.delimiter" = {fg = purple;};
  "punctuation.bracket" = {fg = pink;};
  "keyword.directive" = {fg = green;};
  "function.builtin" = {fg = orange;};
  "function.macro" = {fg = blue;};
  "namespace" = {fg = cyan;};
  "attribute" = {fg = yellow;};
  "constructor" = {fg = green;};
  "module" = {fg = pink;};
  "special" = {fg = cyan;};

  "diff.plus" = {fg = green;};
  "diff.delta" = {fg = yellow;};
  "diff.minus" = {fg = orange;};

  "ui.background" = {
    fg = cyan;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = purple;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = blue;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = yellow;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = orange;
    bg = background_dark;
  };
  "ui.debug" = {fg = pink;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = cyan;
  };
  "ui.linenr" = {fg = purple;};
  "ui.linenr.selected" = {fg = orange;};
  "ui.menu" = {
    fg = green;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = red;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = green;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = red;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = purple;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = orange;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = cyan;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = pink;
  };
  "ui.text" = {fg = blue;};
  "ui.text.focus" = {fg = orange;};
  "ui.window" = {fg = red;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = purple;};
  "warning" = {fg = green;};

  "markup.heading" = {
    fg = cyan;
    modifiers = ["bold"];
  };
  "markup.list" = purple;
  "markup.bold" = {
    fg = red;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = green;
  "markup.link.text" = yellow;
  "markup.quote" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = pink;};
}
