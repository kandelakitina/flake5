{ inputs, outputs, lib, config, pkgs, ... }: {
  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays ++ [
      # inputs.nixneovimplugins.overlays.default
      # inputs.neovim-nightly-overlay.overlay
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home-manager.backupFileExtension = "backup";

  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;

      # This puts all nix stuff in ~/.local/state. But not all nixkpgs work
      # use-xdg-base-directories = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      system-features = [ "kvm" "big-parallel" "nixos-test" ];

      substituters = [
        "https://numtide.cachix.org?priority=3"
      ];

      trusted-public-keys = [
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      ];
    };

    gc = {
      automatic = true;
      dates = "monthly";
      # Delete older generations too
      options = "--delete-older-than 2d";
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Add nixpkgs input to NIX_PATH
    # This lets nix2 commands still use <nixpkgs>
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
  };
}
