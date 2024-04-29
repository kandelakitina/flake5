{
  services = {
    displayManager = { defaultSession = "xfce"; };
    xserver = {
      enable = true;
      displayManager = { lightdm.enable = true; };
      desktopManager = { xfce.enable = true; };
    };
    picom = {
      enable = true;
      fade = true;
      inactiveOpacity = 0.9;
      shadow = true;
      fadeDelta = 4;
    };
  };
}
