{
  description = "NodeJS devShell with precompiled MongoDB binary";

  inputs = {
    flakelight.url = "github:nix-community/flakelight";

    # Pre-compiled mongoDB
    mongodb-bin.url = "github:VanCoding/nix-mongodb-bin";
  };

  outputs = { flakelight, mongodb-bin, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [
          nodejs
          just
          live-server

          # Precompiled MongoDB packages
          mongodb-bin.packages.x86_64-linux.default
          mongosh
        ];

        shellHook = ''
          npm config set prefix '~/.npm-packages'
          export PATH="$HOME/.npm-packages/bin:$PATH"
          export NODE_PATH="$HOME/.npm-packages/lib/node_modules"

          node --version
          mongod --version | head -n 1
          echo "Shell includes: node, mongod, mongosh, just, live-server"
        '';
      };
    };
}
