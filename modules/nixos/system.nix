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
  # programs.seahorse.enable = true;
  # security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  environment.systemPackages = with pkgs; [ gnome.seahorse ];

  # Clipboard share in VM 
  services.spice-vdagentd.enable = true;

  environment.defaultPackages = lib.mkForce [ ];
}
