{
  description = "Simple nodeJS devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ nodejs just node2nix live-server ];
        shellHook = ''
          echo "node `${pkgs.nodejs}/bin/node --version`"
          echo "Run live-server for live-server"
        '';
      };
    };
}
