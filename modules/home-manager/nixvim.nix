{ inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;

    # set leader key
    globals.mapleader = " ";

    # THEME
    colorschemes.cyberdream = {
      enable = true;
      settings = {
        borderless_telescope = true;
        italic_comments = true;
        terminal_colors = true;
        transparent = true;
      };
    };

    # PLUGINS
    plugins = {
      # alpha greeter
      alpha.enable = true;
      alpha.theme = "dashboard";
      # autoclose
      autoclose.enable = true;
      # barbar
      barbar.enable = true;
      # completion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          snippet = { expand = "luasnip"; };
          mapping = {
            # ...
          };
        };
      };
      # toggle comments
      comment.enable = true;
      # indent lines
      indent-blankline.enable = true;
      # lualine status line
      lualine.enable = true;
      # Luasnip snippets
      luasnip.enable = true;
      # lsp
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = { # Rust
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          lua-ls.enable = true; # Lua
          tsserver.enable = true; # Typescript
          nil_ls.enable = true; # Nix
          nixd.enable = true; # Nix
          pylsp.enable = true; # Python
          ruff-lsp.enable = true; # Python formatter
          html.enable = true; # HTML
          jsonls.enable = true; # JSON
          svelte.enable = true; # Svelte
          typst-lsp = { # Typst
            enable = true;
            extraOptions.settings.exportPdf = "onType";
          };
          yamlls.enable = true; # YAML
        };
      };
      # show lsp diagnostics in extra lines
      lsp-lines.enable = true;
      # nvim-tree file explorer
      nvim-tree.enable = true;
      # Color matching start and end symbols
      rainbow-delimiters.enable = true;
      # automatically detect tabstop and shiftwidth
      sleuth.enable = true;
      # search and replace
      spectre.enable = true;
      # Telescope
      telescope.enable = true;
      # Special comments
      todo-comments.enable = true;
      # Integrated terminal
      toggleterm = {
        enable = true;
        settings = {
          direction = "horizontal";
          autochdir = true;
        };
        #openMapping = "<leader>t";
      };
      # Treesitter
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      # css color preview
      vim-css-color.enable = true;
      # keymap overview
      which-key = {
        enable = true;
        registrations = {
          "<leader>f" = " Find";
          "<leader>d" = " Debug";
          "<leader>g" = "󰊢 Git";
          "<leader>l" = " LSP";
          "<leader>t" = " Terminal";
        };
      };
    };
    # KEYMAPS...
    # AUTOCMD...
    # VIM OPTIONS...
    # EXTRACONFIG...
  };
}
