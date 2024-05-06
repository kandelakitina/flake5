{
  description = "Boticelli's Flake Config 5";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware";

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

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland ecosystem
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland = {
    #   url = "github:hyprwm/hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    # hyprcursor = {
    #   url = "github:hyprwm/Hyprcursor";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hypridle = {
    #   url = "github:hyprwm/Hypridle";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprlock = {
    #   url = "github:hyprwm/Hyprlock";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprpaper = {
    #   url = "github:hyprwm/hyprpaper";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # pyprland = {
    #   url = "github:hyprland-community/pyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland-git.url = "github:hyprwm/hyprland";
    # hyprland-xdph-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    # hyprland-protocols-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    # hyprland-nix.url = "github:spikespaz/hyprland-nix";
    # hyprland-nix.inputs = {
    #   hyprland.follows = "hyprland-git";
    #   hyprland-xdph.follows = "hyprland-xdph-git";
    #   hyprland-protocols.follows = "hyprland-protocols-git";
    # };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;

      # This is a helper to expand configs for many systems:
      systems = [
        "x86_64-linux"
        # "aarch64-linux"
      ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit lib;

      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.alejandro);

      nixosConfigurations = {
        vm = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/vm ];
        };
        thinkpad = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/thinkpad ];
        };
      };

      homeConfigurations = {
        "boticelli@vm" = lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/boticelli/vm.nix ];
        };
        "boticelli@thinkpad" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          # pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/boticelli/thinkpad.nix ];
        };
      };
    };
}
