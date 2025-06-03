{ config, pkgs, ... }:

{
  home.packages = with pkgs; with nodePackages; [ nodejs live-server ];
}
