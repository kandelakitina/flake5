{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };
  outputs = { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      devShell = {
        packages = pkgs:
          with pkgs;
          with rubyPackages; [
            ruby
            bundix
            bundler
            pry-byebug
          ];
        shellHook = ''
          echo -e "\e[1;35m💎 Welcome to the Ruby Dev Shell 💎\e[0m"
        '';
      };
    };
}
