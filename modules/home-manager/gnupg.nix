{ lib, ... }: {

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

  home.activation.fixGpgPermissions =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      chmod 700 "$HOME/.gnupg" 2>/dev/null || true
      find "$HOME/.gnupg" -type f -exec chmod 600 {} +
    '';

  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".gnupg" ];
        files = [ ];
      };
    };
  };

}
