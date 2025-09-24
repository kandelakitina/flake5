{ config, pkgs, inputs, ... }:
# let
#   inherit (config) colorScheme;
#   # languages = import ./languages.nix { inherit pkgs inputs; };
# in
{
  home.file = { ".config/helix/languages.toml".source = ./languages.toml; };

  programs.helix = {
    # inherit languages;
    enable = true;

    themes = import ./themes { inherit (config) colorScheme; };

    settings = {
      theme = "boticelliZero";

      editor = {
        shell = [ "fish" "-c" ];
        color-modes = true;
        continue-comments = false;
        cursorline = true;
        idle-timeout = 1;
        completion-replace = true;
        true-color = true;
        # rulers = [80];
        popup-border = "all";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        # Jump around with this buttons
        jump-label-alphabet = "jfkdls;aurieowpqnvmcxz";

        indent-guides = {
          render = true;
          character = "╎";
        };

        lsp = {
          display-messages = true;
          auto-signature-help = false;
          # display-inlay-hints = true;
        };

        # Minimum severity to show a diagnostic after the end of a line
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "error";
          other-lines = "disable";
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
        soft-wrap = {
          enable = true;
          wrap-indicator = "";
        };
      };

      keys.insert = {
        "C-a" = [ "goto_line_start" ];
        "C-e" = [ "goto_line_end_newline" ];
      };

      keys.normal = {

        # Jump around with enter
        "ret" = "goto_word";

        "{" = "goto_prev_paragraph";
        "}" = "goto_next_paragraph";
        "D" = [ "kill_to_line_end" ];
        "esc" = [ "collapse_selection" "keep_primary_selection" ];

        # "X" = "extend_line_above";
        "X" = "select_line_above";
        "C-x" = "extend_to_line_bounds";

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
        # "C-|" = [ "shell_pipe_to" ];
        "C-_" = [ "merge_consecutive_selections" ];
        "V" = [ "copy_selection_on_prev_line" ];
        "C-m" = [ "join_selections_space" ];
        "C-r" = [ "remove_selections" ];

        # Swapping d and c yanking
        "d" = [ "delete_selection_noyank" ];
        "c" = [ "change_selection_noyank" ];
        # "C-d" = [ "delete_selection" ];
        # "C-c" = [ "change_selection" ];

        # Replacing Alt to C
        "C-`" = [ "switch_to_uppercase" ];
        "#" = [ "toggle_comments" ];
        "C-n" = [ "split_selection_on_newline" ];
        "C-minus" = [ "split_selection_on_newline" ];
        "C-[" = [ "shrink_selection" ];
        "C-]" = [ "expand_selection" ];
        "C-," = [ "select_prev_sibling" ];
        "C-." = [ "select_next_sibling" ];

        # Piping to AI
        # "C-l" = [ ":pipe proxychains4 sgpt -c {}" ];
      };

      keys.select = {
        "C-x" = "extend_to_line_bounds";
        "X" = "select_line_above";
      };

      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
        s = ":toggle whitespace.render all none"; # show special symbols
        w = ":toggle soft-wrap.enable"; # toggle line wrap
      };
    };

    # extraPackages = with pkgs;
    #   with nodePackages; [
  };
  home.packages = with pkgs; [
    bash-language-server
    emmet-language-server
    eslint
    # lua-language-server
    marksman
    nil
    nixfmt-classic
    nodePackages.prettier
    dockerfile-language-server
    # nodePackages.stylelint
    # prettierd
    svelte-language-server
    tailwindcss-language-server
    taplo
    typescript-language-server
    vscode-langservers-extracted
    vue-language-server
    yaml-language-server
  ];

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
