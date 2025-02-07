{ pkgs, ... }: {
  home.packages = with pkgs; [ goldendict-ng ];

  home = {
    persistence = {
      "/persist/home/boticelli" = {
        # directories = [ ".config/goldendict" ];
        files = [ ".config/goldendict/config" ];
      };
    };
  };
}
