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
  "constant" = {fg = purple;};
  "constant.character.escape" = {fg = pink;};
  "function" = {fg = green;};
  "keyword" = {fg = pink;};
  "operator" = {fg = pink;};
  "punctuation" = {fg = foreground;};
  "string" = {fg = yellow;};
  "string.regexp" = {fg = red;};
  "tag" = {fg = pink;};
  "type" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "type.enum.variant" = {
    fg = foreground;
    modifiers = ["italic"];
  };
  "variable" = {fg = foreground;};
  "variable.builtin" = {
    fg = cyan;
    modifiers = ["italic"];
  };
  "variable.parameter" = {
    fg = orange;
    modifiers = ["italic"];
  };
  "constant.numeric" = {fg = orange;};
  "variable.other.member" = {fg = cyan;};
  "label" = {fg = red;};
  "punctuation.delimiter" = {fg = green;};
  "punctuation.bracket" = {fg = pink;};
  "keyword.directive" = {fg = yellow;};
  "function.builtin" = {fg = purple;};
  "function.macro" = {fg = green;};
  "namespace" = {fg = orange;};
  "attribute" = {fg = yellow;};
  "constructor" = {fg = cyan;};
  "module" = {fg = pink;};
  "special" = {fg = red;};

  "diff.plus" = {fg = green;};
  "diff.delta" = {fg = orange;};
  "diff.minus" = {fg = red;};

  "ui.background" = {
    fg = foreground;
    bg = background;
  };
  "ui.cursor" = {
    fg = background;
    bg = orange;
    modifiers = ["dim"];
  };
  "ui.cursor.match" = {
    fg = green;
    modifiers = ["underlined"];
  };
  "ui.cursor.primary" = {
    fg = background;
    bg = cyan;
    modifiers = ["dim"];
  };
  "ui.help" = {
    fg = foreground;
    bg = background_dark;
  };
  "ui.debug" = {fg = red;};
  "ui.highlight.frameline" = {
    fg = black;
    bg = red;
  };
  "ui.linenr" = {fg = blue;};
  "ui.linenr.selected" = {fg = foreground;};
  "ui.menu" = {
    fg = foreground;
    bg = background_dark;
  };
  "ui.menu.selected" = {
    fg = cyan;
    bg = background_dark;
  };
  "ui.popup" = {
    fg = foreground;
    bg = background_dark;
  };
  "ui.selection" = {
    fg = background;
    bg = purple;
    modifiers = ["dim"];
  };
  "ui.selection.primary" = {
    fg = background;
    bg = pink;
  };
  "ui.cursorline" = {bg = background_dark;};
  "ui.statusline" = {
    fg = foreground;
    bg = background_dark;
  };
  "ui.statusline.inactive" = {
    fg = blue;
    bg = background_dark;
  };
  "ui.statusline.normal" = {
    fg = background_dark;
    bg = cyan;
  };
  "ui.statusline.insert" = {
    fg = background_dark;
    bg = red;
  };
  "ui.statusline.select" = {
    fg = background_dark;
    bg = purple;
  };
  "ui.text" = {fg = foreground;};
  "ui.text.focus" = {fg = cyan;};
  "ui.window" = {fg = foreground;};
  "ui.virtual.ruler" = {bg = background_dark;};

  "error" = {fg = red;};
  "warning" = {fg = cyan;};

  "markup.heading" = {
    fg = purple;
    modifiers = ["bold"];
  };
  "markup.list" = cyan;
  "markup.bold" = {
    fg = orange;
    modifiers = ["bold"];
  };
  "markup.italic" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "markup.strikethrough" = {modifiers = ["crossed_out"];};
  "markup.link.url" = cyan;
  "markup.link.text" = pink;
  "markup.quote" = {
    fg = yellow;
    modifiers = ["italic"];
  };
  "markup.raw" = {fg = foreground;};
}
