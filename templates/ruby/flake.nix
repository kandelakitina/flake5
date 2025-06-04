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
          \e[31mWelcome to the Ruby development shell! \u{1F48E} \u{1F48E}\e[0m
        '';
      };
    };
}
