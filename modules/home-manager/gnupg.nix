{

  programs.gpg = {
    enable = true;
    settings = {
      no-greeting = true;
      trust-model = "tofu+pgp";
    };
    publicKeys = [{
      source = ../../keys/pgp.asc;
      trust = 5;
    }];
  };

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
