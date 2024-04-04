{colorScheme}: let
  background = "base00";
  background_dark = "base01";
  purple = "base03";
  foreground = "base04";
  red = "base08";
  orange = "base09";
  yellow = "base0A";
  green = "base0B";
  cyan = "base0C";
  pink = "base07";
  black = "base00";
  blue = "base0D";
in {
  "nix-${colorScheme.slug}" = {
    palette = builtins.mapAttrs (name: value: "#${value}") colorScheme.palette;

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
  };
}
