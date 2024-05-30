{

  programs.gpg = { enable = true; };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
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
