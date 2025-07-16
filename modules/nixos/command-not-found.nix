{ inputs, pkgs, ... }: {
  imports = [
    # simple flake to solve 'command-not-found' issue
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite

  ];
  programs.command-not-found.enable = true;
}
