{ config, pkgs, ... }: {
  programs.git = {
    enable = true;

    extraConfig = {
      core = {
        editor = "hx";
        pager = "delta";
      };

      color = { ui = true; };

      interactive = { diffFitler = "delta --color-only"; };

      delta = {
        enable = true;
        navigate = true;
        light = false;
        side-by-side = false;
        options.syntax-theme = "catppuccin";
      };

      pull = { ff = "only"; };

      push = {
        default = "current";
        autoSetupRemote = true;
      };

      init = { defaultBranch = "main"; };
    };
  };

  home.packages = with pkgs; [ delta ];
}
