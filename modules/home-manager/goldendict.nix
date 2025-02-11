{ pkgs, ... }: {
  home.packages = with pkgs; [ goldendict-ng ];

  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [ ".cache/goldendict" ];
        files = [ ".config/goldendict/config" ];
      };
    };
  };
}
