{
  description = "Simple deno devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [
          deno
          just
        ];
        shellHook = ''
          # 'deno info' to see deno's install folders
          # export DENO_DIR="$HOME/.deno-local"
          export PATH="$HOME/.deno/bin:$PATH" # global installs

          deno --version
        '';
      };
    };
}
