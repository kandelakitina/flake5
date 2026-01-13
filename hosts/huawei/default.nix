{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.huawei-machc-wa
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.lenovo-thinkpad-x1-7th-gen

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    inputs.disko.nixosModules.disko
    (import ../../diskoConfigs/DualbootWinNixLuksBtfrs.nix { device = "/dev/nvme0n1"; })

    ../../modules/nixos/sddm.nix
    # ../../modules/nixos/greetd.nix
    # ../../modules/nixos/gnome.nix
    # ../../modules/nixos/xfce.nix
    ../../modules/nixos/hyprland.nix

    # ../../modules/nixos/amnezia.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/command-not-found.nix
    ../../modules/nixos/gnupg.nix
    ../../modules/nixos/impermanence.nix
    ../../modules/nixos/locale.nix
    # ../../modules/nixos/mullvad.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/qt.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/v2ray.nix
    # ../../modules/nixos/vial.nix
    # ../../modules/nixos/virtualisation.nix
    ../../modules/nixos/yubikey.nix

    ../../modules/nixos/users/boticelli.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  services.throttled.enable = false;

  services.xserver.libinput.enable = true; # fix touchpad on Huawei

  # FIXME: Add the rest of your current configuration

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  networking.hostName = "huawei";

  boot.loader.systemd-boot.enable = true;

  environment.variables.EDITOR = "hx";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
  
  # Extra for dual booting with Windows
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."enc".device = "/dev/disk/by-partlabel/luks";
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.configurationLimit = 5;
}
