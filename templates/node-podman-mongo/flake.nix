{
  description = "NodeJS devShell with podman and MongoDB";

  inputs = { flakelight.url = "github:nix-community/flakelight"; };

  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ nodejs just live-server podman podman-compose ];

        shellHook = ''
          # --- Node setup ---
          npm config set prefix '~/.npm-packages'
          export PATH="$HOME/.npm-packages/bin:$PATH"
          export NODE_PATH="$HOME/.npm-packages/lib/node_modules"

          # --- Podman trust policy (dev-only) ---
          export CONTAINERS_POLICY="~/tmp/.containers/policy.json"

          mkdir -p ~/tmp/.containers
          cat > ~/tmp/.containers/policy.json <<'EOF'
          {
            "default": [
              {
                "type": "insecureAcceptAnything"
              }
            ]
          }
          EOF

          # --- Info ---
          node --version
          mongod --version | head -n 1
          echo "Shell includes: node, mongod, mongosh, just, live-server, podman"
        '';
      };
    };
}
