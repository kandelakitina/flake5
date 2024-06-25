{ config, pkgs, ... }:

# To test mako run
# notify-send "hello world\!" "This is a message"

let inherit (config.colorScheme) palette;
in {

  services = {
    mako = {
      enable = true;
      font = config.fontProfiles.regular.family;
      padding = "15";
      defaultTimeout = 5000;
      borderSize = 2;
      borderRadius = 5;
      backgroundColor = "#${palette.base00}";
      borderColor = "#${palette.base06}";
      progressColor = "over #${palette.base0B}";
      textColor = "#${palette.base0D}";
      icons = true;
      actions = true;
      extraConfig = ''
        text-alignment=center
        [urgency=high]
        default-timeout=100000000
        border-color=#${palette.base09}
      '';
    };
  };
}
