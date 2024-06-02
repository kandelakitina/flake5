{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.impermanence.nixosModules.home-manager.impermanence

    ../../modules/home-manager/cliTools
    ../../modules/home-manager/helix
    ../../modules/home-manager/zellij

    ../../modules/home-manager/gnome.nix
    ../../modules/home-manager/hyprland

    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/anki.nix
    ../../modules/home-manager/cheatsheets.nix
    ../../modules/home-manager/firefox.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/gh.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/gnupg.nix
    ../../modules/home-manager/goldendict.nix
    ../../modules/home-manager/mpv.nix
    ../../modules/home-manager/nix.nix
    ../../modules/home-manager/nnn.nix
    ../../modules/home-manager/obsidian.nix
    ../../modules/home-manager/proxychains.nix
    ../../modules/home-manager/sops.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/scripts.nix
    ../../modules/home-manager/sgpt.nix
    ../../modules/home-manager/transmission.nix
    ../../modules/home-manager/telegram.nix
    ../../modules/home-manager/whatsapp.nix
    ../../modules/home-manager/wallpaper.nix
    ../../modules/home-manager/zk.nix
  ];

  colorScheme = import ../../modules/home-manager/colorschemes/iterm.nix;
  # colorscheme = import ../../modules/home-manager/colorschemes/dracula.nix;

  wallpaper = ../../wallpapers/frieren1.jpg;

  fontProfiles = {
    enable = true;
    monospace = {
      family = "JetBrainsMono Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
    };
    # regular = {
    #   family = "Fira Sans";
    #   package = pkgs.fira;
    # };
  };

  # Enable home-manager and git
  programs.git = {
    userName = "boticelli";
    userEmail = "kandelakitina@gmail.com";
  };

  home = {
    username = "boticelli";
    homeDirectory = "/home/${config.home.username}";
    sessionPath = [ "$HOME/.local/bin" ];
    shellAliases = { sysrestart = "systemctl --user reset-failed"; };
    sessionVariables = {
      FLAKE = "$HOME/flake5";
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    persistence = {
      "/persist/home/boticelli" = {
        directories = [
          "Documents"
          "Downloads"
          ".config/sops/age"
          "flake5"
          ".local/bin"
          ".ssh"
          "vault"
        ];
        allowOther = true;
      };
    };
  };

  news = {
    display = "silent";
    json = lib.mkForce { };
    entries = lib.mkForce [ ];
  };
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
