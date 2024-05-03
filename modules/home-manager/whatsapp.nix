{ pkgs, ... }: {
  home.packages = with pkgs; [ whatsapp-for-linux ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories =
          [ ".local/share/whatsapp-for-linux" ".config/whatsapp-for-linux" ];
        files = [ ];
      };
    };
  };
}
