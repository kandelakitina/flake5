{ pkgs, ... }: {
  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        theme =
          "${pkgs.catppuccin-sddm-corners}/share/sddm/themes/catppuccin-sddm-corners";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
    catppuccin-sddm-corners
  ];
}
