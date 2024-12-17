{ lib, pkgs, modulesPath, ... }: {

  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];

  # Turn on network manager (nmtui)
  networking = {
    hostName = "iso";
    networkmanager.enable = true;
    wireless.enable = false;
    # firewall.enable = true;
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    gum
    networkmanager
    git
    (writeShellScriptBin "nix-install" (builtins.readFile ./nix-install.sh))
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    extraOptions = "experimental-features = nix-command flakes";
  };

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems =
      lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
  };

}
