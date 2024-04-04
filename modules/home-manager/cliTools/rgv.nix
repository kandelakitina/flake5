{pkgs, ...}: let
  # rgv = pkgs.writeScriptBin "rgv" ''
  # #!/usr/bin/env bash

  # # Check if nvim is available, otherwise use hx as the editor
  # if command -v nvim > /dev/null 2>&1; then
  #     EDITOR_CMD="nvim {1} +{2}"
  # else
  #     EDITOR_CMD="hx {1} +{2}"
  # fi

  # rg --color=always --line-number --no-heading --smart-case "''${*:-}'" |
  #   fzf --ansi \
  #       --color "hl:-1:underline,hl+:-1:underline:reverse" \
  #       --delimiter : \
  #       --preview 'bat --color=always {1} --highlight-line {2}' \
  #       --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
  #       --bind "enter:execute($EDITOR_CMD)"

  # '';
  rgv = pkgs.writeScriptBin "rgv" ''
    #!/usr/bin/env bash
    rg --color=always --line-number --no-heading --smart-case "''${*:-}" |
    	fzf --ansi \
    			--color "hl:-1:underline,hl+:-1:underline:reverse" \
    			--delimiter : \
    			--preview 'bat --color=always {1} --highlight-line {2}' \
    			--preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    			--bind 'enter:become(hx {1} +{2})'
  '';
in {
  home.packages = [
    rgv
  ];
}
