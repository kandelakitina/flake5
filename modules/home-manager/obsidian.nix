{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
  ];
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [
          ".config/obsidian"
        ];
        files = [
        ];
      };
    };
  };
}
