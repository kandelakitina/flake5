{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dracula_at_night";

      keys.insert = {
        "C-a" = [ "goto_line_start" ];
        "C-e" = [ "goto_line_end_newline" ];
      };

      keys.normal = {
        "C-A-j" = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
        "C-A-k" = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
        "A-j" = [ "open_below" "move_line_up" "normal_mode" ];
        "A-k" = [ "open_above" "move_line_down" "normal_mode" ];
        "D" = [ "kill_to_line_end" ];
        "d" = [ "delete_selection_noyank" ];
        "A-d" = [ "delete_selection" ];
        "c" = [ "change_selection_noyank" ];
        "A-c" = [ "change_selection" ];
        "esc" = [ "collapse_selection" "keep_primary_selection" ];
        "C-(" = [ "rotate_selection_contents_backward" ];
        "C-)" = [ "rotate_selection_contents_forward" ];
        "C-U" = [ "later" ];
        "C-|" = [ "shell_pipe_to" ];
        "C-!" = [ "shell_append_output" ];
        "C-_" = [ "merge_consecutive_selections" ];
        "V" = [ "copy_selection_on_prev_line" ];
        "A-m" = [ "join_selections_space" ];
        "A-r" = [ "remove_selections" ];
      };

      editor = {
        true-color = true;
        line-number = "relative";
        bufferline = "multiple";
        color-modes = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        soft-wrap = {
          enable = true;
        };

        statusline = {
          left = [ "mode" "spinner" "version-control" ];
          center = [ "file-name" ];
        };
      };
    };
  };
}
