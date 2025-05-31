{ config, pkgs, ... }:

# To test mako run
# notify-send "hello world\!" "This is a message"

let inherit (config.colorScheme) palette;
in {
  services.dunst = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    settings = {
      global = {
        follow = "keyboard";
        width = 300;
        font = "${config.fontProfiles.regular.family} 12";
        word_wrap = true;
        frame_width = 2;
        frame_color = "#${palette.base05}";
        separator_color = "frame";
        padding = 8;
        horizontal_padding = 8;
        corner_radius = 8;
        transparency = 10;
        geometry = "300x5-10+10"; # widt
      };

      urgency_low = {
        background = "#${palette.base00}";
        foreground = "#${palette.base03}";
        frame_color = "#${palette.base03}";
        timeout = 5;
      };

      urgency_normal = {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        frame_color = "#${palette.base05}";
        timeout = 8;
      };

      urgency_critical = {
        background = "#${palette.base00}";
        foreground = "#${palette.base08}";
        frame_color = "#${palette.base08}";
        timeout = 10;
      };
    };
  };
}
