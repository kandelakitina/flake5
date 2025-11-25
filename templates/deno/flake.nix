{
  description = "Simple deno devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ just live-server ];
        shellHook = ''
          deno --version
          echo "Run live-server for live-server"
        '';
      };
    };
}
