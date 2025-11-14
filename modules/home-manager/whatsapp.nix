{ pkgs, ... }: {
  home.packages = with pkgs; [ wasistlos ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".local/share/wasistlost" ".config/wasistlost" ];
        files = [ ];
      };
    };
  };
}
