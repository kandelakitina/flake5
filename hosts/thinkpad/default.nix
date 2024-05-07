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

    ../../modules/nixos/sddm.nix
    # ../../modules/nixos/gnome.nix
    # ../../modules/nixos/xfce.nix
    ../../modules/nixos/hyprland.nix

    ../../modules/nixos/gnupg.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/v2ray.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/system.nix

    ../../modules/nixos/users/boticelli.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  services.throttled.enable = false;

  # FIXME: Add the rest of your current configuration

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  networking.hostName = "thinkpad";

  boot.loader.systemd-boot.enable = true;

  environment.variables.EDITOR = "hx";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
