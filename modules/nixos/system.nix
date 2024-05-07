{ lib, pkgs, ... }: {

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  security.sudo = {
    execWheelOnly = true;
    extraConfig = ''
      Defaults lecture = never
    '';
  };

  programs = { ssh.startAgent = true; };

  # # Keyring
  # environment.systemPackages = with pkgs; [ gnome.gnome-keyring ];
  # programs.seahorse.enable = true;
  # security.pam.services.sddm.enableGnomeKeyring = true;
  # security.polkit.enable = true;
  # services.gnome.gnome-keyring.enable = true;

  # Clipboard share in VM 
  services.spice-vdagentd.enable = true;

  environment.defaultPackages = lib.mkForce [ ];
}
