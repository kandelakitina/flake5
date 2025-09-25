{ pkgs, ... }:

{
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.ripdrag}/bin/ripgrag -a -x "$fx"'';
      editor-open = "$$EDITOR $f";
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
          cd $DIR
        }}
      '';
    };

    keybindings = {

      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";

      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';

      # ...
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
      previewer = "${pkgs.ctpv}/bin/ctpv";
      cleaner = "${pkgs.ctpv}/bin/ctpvclear";
    };
  };
  home.shellAliases = { f = "lf"; };
}
