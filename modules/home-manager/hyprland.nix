{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      exec-once = ''
        ${pkgs.waybar}/bin/waybar &
      '';
      bind = [ "SUPER, T, exec, alacritty" ];
    };

  };
}
