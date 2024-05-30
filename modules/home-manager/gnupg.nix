{

  programs.gpg = {
    enable = true;
    settings = {
      enable-ssh-support = true;
      # enableSSHSupport = true;
      # enableExtraSocket = true;
    };
  };
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".gnupg" ];
        files = [ ];
      };
    };
  };

}
