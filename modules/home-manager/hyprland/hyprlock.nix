{ config, lib, ... }:
let inherit (config.colorScheme) palette;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        grace = 2;
      };

      background = {
        color = palette.base00;
        path = "screenshot";
        # path = "~/Pictures/wallpapers/wallpaper";
        blur_passes = 2;
        brightness = 0.5;
      };

      label = {
        text = "LOCKED";
        color = palette.base07;
        font_size = 50;
        font_family = config.fontProfiles.regular.family;
        position = "0, 70";
        halign = "center";
        valign = "center";
      };

      input-field = {
        size = "50, 50";
        dots_size = 0.33;
        dots_spacing = 0.15;
        outer_color = palette.base0C;
        inner_color = palette.base09;
        font_color = palette.base03;
        placeholder_text = "Enter Password";
      };
    };
  };
}
