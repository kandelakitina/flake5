{
  description = "Boticelli's Flake Config 5";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware.url = "github:nixos/nixos-hardware";
    # nix-colors.url = "github:misterio77/nix-colors";

    disko.url = "github:nix-community/disko";

    impermanence.url = "github:nix-community/impermanence";
    persist-retro.url = "github:Geometer1729/persist-retro";

    nix-colors.url = "github:misterio77/nix-colors";

    sops-nix.url = "github:mic92/sops-nix";

    # simple flake to solve 'command-not-found' issue
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;

    # This is a helper to expand configs for many systems:
    systems = [
      "x86_64-linux"
      # "aarch64-linux"
    ];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    inherit lib;

    overlays = import ./overlays {inherit inputs outputs;};
    packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});
    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
    formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);

    nixosConfigurations = {
      vm = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/vm];
      };
    };

    homeConfigurations = {
      "boticelli@vm" = lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home-manager/boticelli/vm.nix];
      };
    };

  };
}
