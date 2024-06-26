{
  pkgs,
  lib,
  ...
}: {
  programs.helix.extraPackages = let
    helix-gpt-wrapper = pkgs.writeScriptBin "helix-gpt" ''
      #!/usr/bin/env bash
      set -e
      ${pkgs.helix-gpt}/bin/helix-gpt $@
    '';
  in
    with pkgs;
    with nodePackages; [
      helix-gpt
      helix-gpt-wrapper

      vscode-langservers-extracted
      vscode-css-languageserver-bin
      typescript
      typescript-language-server
      marksman
      nil
      nixpkgs-fmt
      lua-language-server
      bash-language-server
    ];

  programs.helix.languages = {
    language = let
      deno = lang: {
        command = "${pkgs.deno}/bin/deno";
        args = ["fmt" "-" "--ext" lang];
      };

      prettier = lang: {
        command = "${pkgs.nodePackages.prettier}/bin/prettier";
        args = ["--parser" lang];
      };
      prettierLangs = map (e: {
        name = e;
        formatter = prettier e;
      });
      langs = ["css" "scss" "html" "javascript"];
    in
      [
        {
          name = "toml";
          language-servers = ["taplo" "gpt"];
          formatter = deno "toml";
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = ["yaml-language-server" "gpt"];
        }
        {
          name = "nix";
          language-servers = ["nil" "gpt"];
          formatter = {
            command = "alejandro";
          };
          auto-format = true;
        }
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = ["-i" "2"];
          };
        }
        {
          name = "clojure";
          injection-regex = "(clojure|clj|edn|boot|yuck)";
          file-types = ["clj" "cljs" "cljc" "clje" "cljr" "cljx" "edn" "boot" "yuck"];
        }
        {
          name = "javascript";
          auto-format = true;
          language-servers = ["gpt" "dprint" "typescript-language-server"];
        }
        {
          name = "json";
          formatter = deno "json";
        }
        {
          name = "markdown";
          language-servers = ["marksman" "gpt"];
          formatter = {
            command = "dprint";
            args = ["fmt" "--stdin" "md"];
          };
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
          language-servers = ["gpt" "dprint" "typescript-language-server"];
        }
      ]
      ++ prettierLangs langs;

    language-server = {
      "gpt" = {
        command = "helix-gpt";
        args = [
          "--handler"
          "copilot"
        ];
      };

      bash-language-server = {
        command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server";
        args = ["start"];
      };

      clangd = {
        command = "${pkgs.clang-tools}/bin/clangd";
        clangd.fallbackFlags = ["-std=c++2b"];
      };

      deno-lsp = {
        command = lib.getExe pkgs.deno;
        args = ["lsp"];
        environment.NO_COLOR = "1";
        config.deno = {
          enable = true;
          lint = true;
          unstable = true;
          suggest = {
            completeFunctionCalls = false;
            imports = {hosts."https://deno.land" = true;};
          };
          inlayHints = {
            enumMemberValues.enabled = true;
            functionLikeReturnTypes.enabled = true;
            parameterNames.enabled = "all";
            parameterTypes.enabled = true;
            propertyDeclarationTypes.enabled = true;
            variableTypes.enabled = true;
          };
        };
      };

      dprint = {
        command = lib.getExe pkgs.dprint;
        args = ["lsp"];
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      typescript-language-server = {
        command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = ["--stdio"];
        config = let
          inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
          };
        in {
          typescript-language-server.source = {
            addMissingImports.ts = true;
            fixAll.ts = true;
            organizeImports.ts = true;
            removeUnusedImports.ts = true;
            sortImports.ts = true;
          };

          typescript = {inherit inlayHints;};
          javascript = {inherit inlayHints;};

          hostInfo = "helix";
        };
      };

      vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };
    };
  };
}
