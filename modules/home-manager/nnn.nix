{ config, lib, pkgs, ... }: {
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    # extraPackages = with pkgs; [ bat eza fzf imv mediainfo ffmpegthumbnailer ];
    # plugins = {
    #   src = "${pkgs.nnn.src}/plugins";
    #   mappings = {
    #     c = "fzcd";
    #     f = "finder";
    #     o = "fzopen";
    #     p = "preview-tui";
    #     t = "nmount";
    #     v = "imgview";
    #   };
    # };
  };
  home.shellAliases = { f = "nnn"; };
}
