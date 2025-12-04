{
  description = "Simple nodeJS devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ nodejs just live-server ];
        shellHook = ''
          # Moving npm to local folder instead of nix store
          npm config set prefix '~/.npm-packages'
          export PATH="$HOME/.npm-packages/bin:$PATH"
          export NODE_PATH="$HOME/.npm-packages/lib/node_modules"

          echo "node `${pkgs.nodejs}/bin/node --version`"
          echo "Run live-server for live-server"
        '';
      };
    };
}
