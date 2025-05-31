{ lib, pkgs, inputs, ... }: {

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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    SHELL = "${lib.getExe pkgs.fish}";
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  environment.systemPackages = with pkgs; [
    alacritty
    grimblast
    libnotify
    polkit_gnome
    # polkit-kde-agent
    swaybg
    # swaynotificationcenter
    # mako
    waybar
    wl-clipboard
    wofi
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

  # security.pam.services.greetd = {
  #   allowNullPassword = true;
  #   startSession = true;
  #   enableGnomeKeyring = true;
  # };
}
