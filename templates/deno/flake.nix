{
  description = "Simple deno devShell flake";

  inputs.flakelight.url = "github:nix-community/flakelight";
  outputs = { flakelight, ... }:
    flakelight ./. {
      devShell = pkgs: {
        packages = with pkgs; [ just live-server ];
        shellHook = ''
          export PATH="/home/boticelli/.deno/bin:$PATH"

          echo -e "\033[32mdeno \`${pkgs.deno}/bin/deno --version\`\033[0m"
          echo -e "\033[33mRun live-server for live-server\033[0m"
        '';
      };
    };
}
