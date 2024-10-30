{ config, pkgs, inputs, ... }:
let
  inherit (config) colorScheme;
  languages = import ./languages.nix { inherit pkgs inputs; };
in {

  programs.helix = {
    inherit languages;
    enable = true;

    themes = import ./themes { inherit colorScheme; };

    settings = {
      theme = "boticelliZero";

      editor = {
        color-modes = true;
        cursorline = true;
        idle-timeout = 1;
        completion-replace = true;
        true-color = true;
        # rulers = [80];

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        # indent-guides = {
        #   render = true;
        #   character = "┊";
        # };

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        gutters = [ "diagnostics" "line-numbers" "spacer" "diff" ];

        statusline = {
          left = [
            "mode"
            "spacer"
            "diagnostics"
            "version-control"
            "read-only-indicator"
            "file-modification-indicator"
            "spinner"
            "file-name"
          ];
          right = [ "file-encoding" "file-type" "selections" "position" ];
        };

        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      keys.insert = {
        "C-a" = [ "goto_line_start" ];
        "C-e" = [ "goto_line_end_newline" ];
      };

      keys.normal = {
        "{" = "goto_prev_paragraph";
        "}" = "goto_next_paragraph";
        "X" = "extend_line_above";
        "D" = [ "kill_to_line_end" ];
        "esc" = [ "collapse_selection" "keep_primary_selection" ];

        space.space = "file_picker";
        space.w = ":w";
        space.q = ":bc";

        "C-j" = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
        "C-k" = [
          "extend_to_line_bounds"
          "delete_selection"
          "move_line_up"
          "paste_before"
        ];

        # "C-(" = [ "rotate_selection_contents_backward" ];
        # "C-)" = [ "rotate_selection_contents_forward" ];
        "C-U" = [ "later" ];
        # "C-|" = [ "shell_pipe_to" ];
        "C-!" = [ "shell_append_output" ];
        "C-_" = [ "merge_consecutive_selections" ];
        "V" = [ "copy_selection_on_prev_line" ];
        "C-m" = [ "join_selections_space" ];
        "C-r" = [ "remove_selections" ];
      };

      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
        s = ":toggle whitespace.render all none"; # show special symbols
        w = ":toggle soft-wrap.enable"; # toggle line wrap
      };
    };

    extraPackages = with pkgs;
      with nodePackages; [
        vscode-langservers-extracted
        # vscode-css-languageserver-bin
        typescript
        typescript-language-server
        marksman
        nil
        nixfmt-classic
        lua-language-server
        bash-language-server
      ];

    # package = inputs.helix.packages.${pkgs.system}.default.overrideAttrs (old: {
    #   makeWrapperArgs = with pkgs;
    #     old.makeWrapperArgs
    #     or []
    #     ++ [
    #       "--suffix"
    #       "PATH"
    #       ":"
    #       (lib.makeBinPath [
    #         clang-tools
    #         marksman
    #         nil
    #         nodePackages.bash-language-server
    #         nodePackages.vscode-css-languageserver-bin
    #         nodePackages.vscode-langservers-extracted
    #         shellcheck
    #       ])
    #     ];
    # });
  };

  # home.packages = with pkgs; [
  #   nil
  #   nixfmt
  #   lua-language-server
  #   vscode-langservers-extracted

  #   # zls
  #   taplo
  #   ltex-ls

  #   buf-language-server
  #   pb

  #   # golangci-lint-langserver
  #   yaml-language-server
  #   # python311Packages.python-lsp-server

  #   # haskellPackages.haskell-language-server
  #   # ocamlPackages.ocaml-lsp
  #   # nls
  #   marksman
  # ];

  home.file.".config/helix/ignore".text = ''
    !.*env*
    !.dockerignore
    !.github/
    !.gitignore
    !.gitattributes
    !.eslintrc*
    !.prettierc*
    !.cargo/
  '';
}
