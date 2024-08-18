{ pkgs, ... }: {
  home.packages = with pkgs; [ yubikey-touch-detector ];
  home.persistence = {
    "/persist/home/boticelli" = {
      directories = [ ".config/Yubico" ];
      allowOther = true;
    };
  };
}
