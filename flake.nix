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
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    # firefox-gnome-theme = {
    #   url = "github:rafaelmardojai/firefox-gnome-theme";
    #   flake = false;
    # };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland ecosystem
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
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

  outputs = { self, nixpkgs, home-manager, nix-colors, ... }@inputs:
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
      templates = import ./templates;
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nixfmt-classic);

      nixosConfigurations = {
        beelink = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/beelink ];
        };
        # not currently implemented:
        # vm = lib.nixosSystem {
        #   specialArgs = { inherit inputs outputs; };
        #   modules = [ ./hosts/vm ];
        # };
        iso = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/iso ];
        };
      };

      homeConfigurations = {
        # "boticelli@vm" = lib.homeManagerConfiguration {
        #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
        #   extraSpecialArgs = { inherit nix-colors inputs outputs; };
        #   modules = [ ./home-manager/boticelli/vm.nix ];
        # };
        "boticelli@beelink" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          # pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit nix-colors inputs outputs; };
          modules = [ ./home-manager/boticelli/beelink.nix ];
        };
      };
    };
}
