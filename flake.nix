{
  description = "Boticelli's Flake Config 5";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware.url = "github:nixos/nixos-hardware";
    # nix-colors.url = "github:misterio77/nix-colors";

    disko.url = "github:nix-community/disko";

    impermanence.url = "github:nix-community/impermanence";
    persist-retro.url = "github:Geometer1729/persist-retro";

    nix-colors.url = "github:misterio77/nix-colors";

    sops-nix.url = "github:mic92/sops-nix"; 

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/vm];
      };
    };

    homeConfigurations = {
      "boticelli@vm" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home-manager/boticelli/vm.nix];
      };
    };
  };
}
