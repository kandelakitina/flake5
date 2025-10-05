{
  description = "Simple nodeJS devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ nodejs just node2nix ];
        shellHook = ''
          echo "node `${pkgs.node}/bin/node --version`"
        '';
      };
    };
}
