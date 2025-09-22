{
  description = "A simple Rails app with Tailwind + daisyUI";

  nixConfig = {
    extra-substituters = "https://nixpkgs-ruby.cachix.org";
    extra-trusted-public-keys =
      "nixpkgs-ruby.cachix.org-1:vrcdi50fTolOxWCZZkw0jakOnUI1T19oYJ+PRYdK4SM=";
  };

  inputs = {
    nixpkgs.url = "nixpkgs";
    ruby-nix.url = "github:inscapist/ruby-nix";
    # a fork that supports platform dependant gem
    bundix = {
      url = "github:kandelakitina/bundix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fu.url = "github:numtide/flake-utils";
    bob-ruby.url = "github:bobvanderlinden/nixpkgs-ruby";
    bob-ruby.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, fu, ruby-nix, bundix, bob-ruby, ... }:
    with fu.lib;
    eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ bob-ruby.overlays.default ];
        };
        rubyNix = ruby-nix.lib pkgs;

        gemset =
          if builtins.pathExists ./gemset.nix then import ./gemset.nix else { };

        # If you want to override gem build config, see
        #   https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/ruby-modules/gem-config/default.nix
        gemConfig = { };

        # See available versions here: https://github.com/bobvanderlinden/nixpkgs-ruby/blob/master/ruby/versions.json
        ruby = pkgs.ruby;

        # Running bundix would regenerate `gemset.nix`
        bundixcli = bundix.packages.${system}.default;

        # Use these instead of the original `bundle <mutate>` commands
        bundleLock = pkgs.writeShellScriptBin "bundle-lock" ''
          export BUNDLE_PATH=vendor/bundle
          bundle lock
        '';
        bundleUpdate = pkgs.writeShellScriptBin "bundle-update" ''
          export BUNDLE_PATH=vendor/bundle
          bundle lock --update
        '';

        # --- Node2nix integration ---
        # Generate with:
        #   node2nix -i package.json -o node-packages.nix -c composition.nix
        nodeEnv = if builtins.pathExists ./node-packages.nix then
          import ./composition.nix { inherit pkgs system; }
        else
          null;
      in rec {
        inherit (rubyNix {
          inherit gemset ruby;
          name = "my-rails-app";
          gemConfig = pkgs.defaultGemConfig // gemConfig;
        })
          env;

        devShells = rec {
          default = dev;
          dev = pkgs.mkShell {
            buildInputs = [ env bundixcli bundleLock bundleUpdate ]
              ++ (with pkgs; [
                yarn
                nodejs
                sqlite
                just
                tailwindcss
                foreman
                node2nix
              ]) ++ pkgs.lib.optional (nodeEnv != null) nodeEnv;

            shellHook = ''
              export RUBYOPT=-W0 # kills bundler spam and stub warnings
              export PATH=$PATH:./node_modules/.bin

              echo -e "\n\033[1;33m🚀 Rails dev environment is live with Tailwind + daisyUI!\033[0m"
              echo -e "\033[1;34m Available just commands:\033[0m"
              just --summary
            '';
          };
        };
      });
}
