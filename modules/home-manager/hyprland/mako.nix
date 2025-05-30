{ config, pkgs, ... }:

# To test mako run
# notify-send "hello world\!" "This is a message"

let inherit (config.colorScheme) palette;
in {

  services = {
    mako = {
      # settings = {
      enable = true;
      font = config.fontProfiles.regular.family;
      padding = "15";
      defaultTimeout = 5000;
      backgroundColor = "#${palette.base00}";
      borderSize = 2;
      borderRadius = 5;
      # border-color = "#${palette.base06}";
      # progress-color = "over #${palette.base0B}";
      # text-color = "#${palette.base0D}";
      # icons = true;
      # actions = true;
      # textAlignment = "center";
      # urgency = "high";
      # };
    };
  };
}
