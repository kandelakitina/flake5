{ pkgs, inputs, ... }: {

  # imports = [ inputs.hyprland.nixosModules.default ];

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = pkgs.hyprland;
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };
  environment.systemPackages = with pkgs; [
    waybar
    libnotify
    rofi
    swaybg
    swaynotificationcenter
    alacritty
    rofi-wayland
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  # programs.regreet.enable = true;
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     initial_session = {
  #       user = "boticelli";
  #       command = "$SHELL -l";
  #     };
  #   };
  # };

  # programs.dconf.enable = true;

  # security.pam.services.greetd = {
  #   allowNullPassword = true;
  #   startSession = true;
  #   enableGnomeKeyring = true;
  # };

}
