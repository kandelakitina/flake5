{
  programs.zk = {
    enable = true;
    settings = {
      notebook = {
        dir = "~/vault";
      };
      note = {
        template = "yaml_tags.md";
        default-title = "{{id}}-Untitled";
        filename = "{{title}}";
      };
      extra = {
        author = "boticelli";
      };
      format.markdown = {
        hashtags = true;
        link-format = "wiki";
      };
      tool = {
        fzf-preview = "bat -p --color always {-1}";
      };
      alias = {
        last = "zk edit --limit 1 --sort modified- $argv";
        ls = "zk list $argv";
        open = "zk edit -i $argv";
        add = "zk new --title \"$argv\"";
        recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
        conf = ''$EDITOR "$ZK_NOTEBOOK_DIR/.zk/config.toml"''; # Adjusted for proper string handling in Nix
      };
      lsp = {
        diagnostics = {
          wiki-title = "hint";
          dead-link = "error";
        };
        completion = {
          note-label = "{{title-or-path}}";
          note-filter-text = "{{title}} {{path}}";
          note-detail = "{{filename-stem}}";
        };
      };
    };
  };
}
