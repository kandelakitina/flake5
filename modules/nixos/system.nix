{
  networking = { networkmanager.enable = true; };

  security = {
    pam.services.sddm.enableGnomeKeyring = true;
    polkit.enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
    spice-vdagentd.enable = true; # Clipboard share in VM
  };
}
