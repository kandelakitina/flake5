{ pkgs, config, ... }: {

  home.packages = with pkgs; [ shell-gpt ];
  home.shellAliases = { sgpt = "proxychains4 -q sgpt"; };

}
