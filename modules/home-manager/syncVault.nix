{ pkgs, ... }:
let
  gitSyncVault = pkgs.writeScriptBin "git-sync-vault" # bash
    ''
      #!/bin/sh

      VAULT_DIR="$HOME/vault"
      cd $VAULT_DIR || exit 1
      git add .
      git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0
    '';
in {
  home.packages = [ gitSyncVault ];

  systemd.user.services.git-sync-vault = {
    Unit = {
      Description = "Sync Obsidian Vault with GitHub";
      Wants = "git-sync-vault.timer";
    };
    Service = {
      ExecStart = "${gitSyncVault}/bin/git-sync-vault";
      Type = "simple";
    };
  };

  systemd.user.timers.git-sync-vault = {
    Unit.Description = "Run Git Sync for Obsidian Vault";
    Timer.OnCalendar = "*:0/15";
    Install.WantedBy = [ "timers.target" ];
  };
}
