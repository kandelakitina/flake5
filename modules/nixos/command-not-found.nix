{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # simple flake to solve 'command-not-found' issue
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite

  ];
  programs.command-not-found.enable = true;
  programs.command-not-found.dbPath =
    lib.mkForce
      inputs.flake-programs-sqlite.packages.${pkgs.system}.programs-sqlite;
}
