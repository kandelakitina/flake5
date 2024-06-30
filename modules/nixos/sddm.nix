{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.sddm-sugar-candy-nix.nixosModules.default ];
  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        sugarCandyNix = {
          enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
          settings = {
            # Set your configuration options here.
            Background = lib.cleanSource ../../wallpapers/frieren1.jpg;
            ScreenWidth = 1920;
            ScreenHeight = 1080;
            # FormPosition = "left";
            # HaveFormBackground = true;
            PartialBlur = true;
            ForceLastUser = true;
            HeaderText = "";
            MainColor = "#47a0f3";
            AccentColor = "#7b5cb0";
            BackgroundColor = "#101421";
          };
        };
        # theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili/";
        # theme = "${pkgs.catppuccin-sddm-corners}/share/sddm/themes/catppuccin-sddm-corners";
      };
    };
  };
  environment.systemPackages = with pkgs;
    [
      libsForQt5.qt5.qtgraphicaleffects
      # catppuccin-sddm-corners
      # sddm-chili-theme
    ];
}
