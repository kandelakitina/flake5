{ pkgs, ... }: {

  home.packages = with pkgs; [ shell_gpt ];
  home.shellAliases = { sgpt = "proxychains4 -q sgpt"; };

}
