{ pkgs, ... }: {
  home.packages = [ (import ./runAlacritty.nix { inherit pkgs; }) ];
}
