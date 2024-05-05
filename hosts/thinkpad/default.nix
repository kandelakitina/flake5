{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.hardware.nixosModules.lenovo-thinkpad-x1-7th-gen

    # simple flake to solve 'command-not-found' issue
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    inputs.disko.nixosModules.disko
    (import ../../diskoConfigs/btfrs.nix { device = "/dev/vda"; })

    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/gnome.nix
    # ../../modules/nixos/xfce.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/v2ray.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/ssh.nix

    ../../modules/nixos/users/boticelli.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  # FIXME: Add the rest of your current configuration

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  networking.hostName = "thinkpad";

  boot.loader.systemd-boot.enable = true;

  services.spice-vdagentd.enable = true; # Clipboard share in VM

  environment.variables.EDITOR = "hx";

  networking = {
    networkmanager.enable = true;
    # wireless.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
