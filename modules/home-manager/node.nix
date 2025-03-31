{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.packages = with pkgs; with nodePackages; [ nodejs live-server ];
}
