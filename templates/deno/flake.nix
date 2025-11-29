{
  description = "Simple deno devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [
          just
          live-server # rust live-server
          # posting # TUI API client
        ];
        shellHook = ''
          export PATH="/home/boticelli/.deno/bin:$PATH"

          deno --version
          echo -e "This shell provides: live-server, posting"
        '';
      };
    };
}
