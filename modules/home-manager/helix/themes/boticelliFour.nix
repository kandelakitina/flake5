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
  "constant" = {fg = orange;};
  "constant.character.escape" = {fg = blue;};
  "function" = {fg = red;};
  "keyword" = {fg = pink;};
  "operator" = {fg = yellow;};
  "punctuation" = {fg = cyan;};
  "string" = {fg = purple;};
  "string.regexp" = {fg = green;};
  "tag" = {fg = cyan;};
  "type" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "variable" = {fg = pink;};
  "variable.builtin" = {
    fg = blue;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = red;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = green;};
  "variable.other.member" = {fg = purple;};
  "label" = {fg = cyan;};
  "punctuation.delimiter" = {fg = orange;};
  "punctuation.bracket" = {fg = red;};
  "keyword.directive" = {fg = pink;};
  "function.builtin" = {fg = cyan;};
  "function.macro" = {fg = yellow;};
  "namespace" = {fg = blue;};
  "attribute" = {fg = red;};
  "constructor" = {fg = pink;};
  "module" = {fg = yellow;};
  "special" = {fg = blue;};

  "diff.plus" = {fg = cyan;};
  "diff.delta" = {fg = red;};
  "diff.minus" = {fg = purple;};

  "ui.background" = {
    fg = orange;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = purple;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = cyan;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background_dark;
    bg = orange;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = pink;
    bg = background_dark;
  };
  "ui.debug" = {fg = green;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = yellow;
  };
  "ui.linenr" = {fg = blue;};
  "ui.linenr.selected" = {fg = cyan;};
  "ui.menu" = {
    fg = red;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = purple;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = blue;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = green;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = red;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = cyan;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = pink;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = green;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = yellow;
  };
  "ui.text" = {fg = orange;};
  "ui.text.focus" = {fg = blue;};
  "ui.window" = {fg = purple;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = red;};
  "warning" = {fg = pink;};

  "markup.heading" = {
    fg = green;
    modifiers = ["bold"];
  };
  "markup.list" = blue;
  "markup.bold" = {
    fg = yellow;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = purple;
  "markup.link.text" = orange;
  "markup.quote" = {
    fg = red;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = green;};
}
