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
  "comment" = {fg = orange;};
  "constant" = {fg = pink;};
  "constant.character.escape" = {fg = purple;};
  "function" = {fg = cyan;};
  "keyword" = {fg = green;};
  "operator" = {fg = red;};
  "punctuation" = {fg = yellow;};
  "string" = {fg = blue;};
  "string.regexp" = {fg = pink;};
  "tag" = {fg = red;};
  "type" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "variable" = {fg = yellow;};
  "variable.builtin" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = green;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = red;};
  "variable.other.member" = {fg = cyan;};
  "label" = {fg = blue;};
  "punctuation.delimiter" = {fg = green;};
  "punctuation.bracket" = {fg = orange;};
  "keyword.directive" = {fg = pink;};
  "function.builtin" = {fg = red;};
  "function.macro" = {fg = yellow;};
  "namespace" = {fg = purple;};
  "attribute" = {fg = cyan;};
  "constructor" = {fg = blue;};
  "module" = {fg = orange;};
  "special" = {fg = purple;};

  "diff.plus" = {fg = cyan;};
  "diff.delta" = {fg = blue;};
  "diff.minus" = {fg = green;};

  "ui.background" = {
    fg = pink;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = yellow;
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
    fg = blue;
    bg = background_dark;
  };
  "ui.debug" = {fg = orange;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = pink;
  };
  "ui.linenr" = {fg = cyan;};
  "ui.linenr.selected" = {fg = red;};
  "ui.menu" = {
    fg = purple;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = green;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = cyan;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background_dark;
    bg = blue;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = green;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = yellow;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = pink;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = purple;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = cyan;
  };
  "ui.text" = {fg = red;};
  "ui.text.focus" = {fg = purple;};
  "ui.window" = {fg = orange;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = blue;};
  "warning" = {fg = red;};

  "markup.heading" = {
    fg = green;
    modifiers = ["bold"];
  };
  "markup.list" = red;
  "markup.bold" = {
    fg = cyan;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = purple;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = blue;
  "markup.link.text" = yellow;
  "markup.quote" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = pink;};
}
