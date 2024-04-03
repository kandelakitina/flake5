{

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Ubuntu" "UbuntuMono" ]; })
  ];
  
  fonts.fontconfig.enable = true;
}
