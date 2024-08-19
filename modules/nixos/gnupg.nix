{

  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      enableExtraSocket = true;
    };
  };
  hardware.gpgSmartcards.enable = true;
}
