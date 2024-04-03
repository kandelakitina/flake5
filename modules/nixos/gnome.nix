{
  services = {

    # Gnome settings
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        defaultSession = "gnome";
      };
      desktopManager = {
        gnome.enable = true;
      };
    };
  };
}

