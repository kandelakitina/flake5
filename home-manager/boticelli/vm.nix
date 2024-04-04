{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../../modules/home-manager/cliTools
    ../../modules/home-manager/helix
    ../../modules/home-manager/zellij

    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/cheatsheets.nix
    ../../modules/home-manager/nnn.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "electron-24.8.6"
      ];
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.shellAliases = {
    hms = "home-manager switch --flake";
    nrs = "sudo nixos-rebuild switch --flake";
  };

  # TODO: Set your username
  home = {
    username = "boticelli";
    homeDirectory = "/home/boticelli";
  };

  colorscheme = import ../../modules/home-manager/colorschemes/iterm.nix;

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
