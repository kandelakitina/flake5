{ pkgs, ... }: {
  home.packages = with pkgs; [ telegram-desktop ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".local/share/TelegramDesktop" ];
        files = [ ];
      };
    };
  };
}
