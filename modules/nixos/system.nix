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

  # # Keyring
  # programs = {
  #   ssh.startAgent = true;
  #   seahorse.enable = true;
  # };
  # services.gnome.gnome-keyring.enable = true;
  # security.pam.services.sddm.enableGnomeKeyring = true;
  # security.polkit.enable = true;
  # environment.systemPackages = with pkgs; [ gnome.seahorse libsecret ];

  # Clipboard share in VM 
  services.spice-vdagentd.enable = true;

  environment.defaultPackages = with pkgs; lib.mkForce [ wget ];

  home-manager.backupFileExtension = "backup";
}
