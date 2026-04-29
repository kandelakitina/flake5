{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      pager = {
        delta = {
          enable = true;
        };
      };
      core = {
        editor = "hx";
      };

      color.ui = true;

      pull.ff = "only";

      push = {
        default = "current";
        autoSetupRemote = true;
      };

      init.defaultBranch = "main";
    };
  };

  programs.delta = {
    enable = true;

    # IMPORTANT: this is now required
    enableGitIntegration = true;

    options = {
      syntax-theme = "ansi";
      # navigate = true;
      # light = false;
      # side-by-side = false;

      # features = "hyperlinks";
      # file-added-label = "[+]";
      # file-copied-label = "[C]";
      # file-decoration-style = "yellow ul";
      # file-modified-label = "[M]";
      # file-removed-label = "[-]";
      # file-renamed-label = "[R]";
      # file-style = "yellow bold";
      # hunk-header-decoration-style = "omit";
      # hunk-header-style = "syntax italic #303030";
      # minus-emph-style = "syntax bold #780000";
      # minus-style = "syntax #400000";
      # plus-emph-style = "syntax bold #007800";
      # plus-style = "syntax #004000";
      # width = 1;
    };
  };
}
