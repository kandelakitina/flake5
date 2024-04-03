{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        xfce.enable = true;
        defaultSession = "xfce";
      };
      desktopManager = {
        xfce.enable = true;
      };
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