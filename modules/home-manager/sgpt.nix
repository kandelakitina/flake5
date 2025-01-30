{ pkgs, ... }:
let
  ai = pkgs.writeShellScriptBin "ai" # bash
    ''
      #!/bin/sh
      proxychains4 -q sgpt "$@"
    '';
in { home.packages = with pkgs; [ ai shell-gpt ]; }
