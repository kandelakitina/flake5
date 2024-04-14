{pkgs, ...}: {
  home.packages = with pkgs; [
    anki-bin
  ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [
          ".local/share/Anki2"
        ];
        files = [
        ];
      };
    };
  };
}
