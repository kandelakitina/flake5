{ pkgs, ... }: {
  home.packages = with pkgs; [ transmission_4-gtk ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".config/transmission" ];
        files = [ ];
      };
    };
  };
}
