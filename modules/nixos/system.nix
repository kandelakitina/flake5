{
  security.polkit.enable = true;
  networking.networkmanager = { enable = true; };
  services.spice-vdagentd.enable = true; # Clipboard share in VM
}
