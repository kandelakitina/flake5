{ pkgs, config, ... }: {

  home.packages = with pkgs; [ shell-gpt ];
  home.shellAliases = { sgpt = "proxychains4 -q sgpt"; };

  # sops.secrets.sgptrc = { path = "/home/boticelli/.config/shell_gpt/.sgptrc"; };

  sops.secrets.OPENAI = { };
  programs.fish.shellInit = ''
    set -x OPENAI_API_KEY (cat ${config.sops.secrets.OPENAI.path})
  '';

}
