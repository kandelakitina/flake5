{
  programs.lazygit = {
    enable = true;

    # Uncomment in late 2025 or something
    # after the - Changed 'subprocess: true' to 'output: terminal' in custom command
    # breaking change problem solves itself

    # settings = {
    #   update.method = "never";
    #   git = {
    #     paging = {
    #       colorArg = "always";
    #       pager = "delta --color-only --dark --paging=never";
    #       useConfig = false;
    #     };
    #   };
    #   gui.theme = {
    #     lightTheme = false;
    #     # activeBorderColor = ["#${config.colorscheme.colors.base0B}" "bold"];
    #     # inactiveBorderColor = ["#${config.colorscheme.colors.base05}"];
    #     # optionsTextColor = ["#${config.colorscheme.colors.base0D}"];
    #     # selectedLineBgColor = ["#${config.colorscheme.colors.base02}"];
    #     # selectedRangeBgColor = ["#${config.colorscheme.colors.base02}"];
    #     # cherryPickedCommitBgColor = ["#${config.colorscheme.colors.base0C}"];
    #     # cherryPickedCommitFgColor = ["#${config.colorscheme.colors.base0D}"];
    #     # unstagedChangesColor = ["#${config.colorscheme.colors.base08}"];
    #   };
    #   customCommands = [
    #     {
    #       key = "W";
    #       command = "git commit -m '{{index .PromptResponses 0}}' --no-verify";
    #       description = "commit without verification";
    #       context = "global";
    #       subprocess = true;
    #     }
    #     {
    #       key = "S";
    #       command =
    #         "git commit -m '{{index .PromptResponses 0}}' --no-gpg-sign";
    #       description = "commit without gpg signing";
    #       context = "global";
    #       subprocess = true;
    #     }
    #     {
    #       description = "Delete both local and remote branch";
    #       key = "D";
    #       context = "localBranches";
    #       prompts = [{
    #         type = "confirm";
    #         title = "Delete both local and remote branch";
    #         body =
    #           "Are you are you want to delete this branch both locally and remotely?";
    #       }];
    #       loadingText = "Deleting branch";
    #       command =
    #         "git push {{ .SelectedLocalBranch.UpstreamRemote }} --delete {{ .SelectedLocalBranch.UpstreamBranch }}; git branch --delete --force {{ .SelectedLocalBranch.Name }}";
    #     }
    #     {
    #       description = "Push branch to origin";
    #       key = "<c-p>";
    #       context = "localBranches";
    #       loadingText = "Pushing to origin";
    #       command = "git push --set-upstream origin";
    #     }
    #   ];
    # };
  };

  # Remove after the above is solved
  home.file.".config/lazygit/config.yml".text = # yml
    ''
        customCommands:
      - command: git commit -m '{{index .PromptResponses 0}}' --no-verify
        context: global
        description: commit without verification
        key: W
        output: terminal
      - command: git commit -m '{{index .PromptResponses 0}}' --no-gpg-sign
        context: global
        description: commit without gpg signing
        key: S
        output: terminal
      - command: git push {{ .SelectedLocalBranch.UpstreamRemote }} --delete {{ .SelectedLocalBranch.UpstreamBranch
          }}; git branch --delete --force {{ .SelectedLocalBranch.Name }}
        context: localBranches
        description: Delete both local and remote branch
        key: D
        loadingText: Deleting branch
        prompts:
        - body: Are you are you want to delete this branch both locally and remotely?
          title: Delete both local and remote branch
          type: confirm
      - command: git push --set-upstream origin
        context: localBranches
        description: Push branch to origin
        key: <c-p>
        loadingText: Pushing to origin
      git:
        paging:
          colorArg: always
          pager: delta --color-only --dark --paging=never
          useConfig: false
      gui:
        theme:
          lightTheme: false
      update:
        method: never
    '';

  home.shellAliases = { lg = "lazygit"; };

}
