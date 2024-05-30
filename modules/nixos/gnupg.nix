{

  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      enableExtraSocket = true;
    };
  };

  # environment.persistence."/persist" = {
  #   hideMounts = true;
  #   directories = [ "/home/boticelli/.gnupg" ];
  # };

}
