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

  # Fixes a bug where GnuPG requires to insert already inserted yubikey
  programs.gpg.scdaemonSettings = { disable-ccid = true; };

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
