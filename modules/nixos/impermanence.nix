{ config, lib, inputs, ... }: {
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  boot.initrd.postDeviceCommands = # sh
    ''
      mkdir /btrfs_tmp
      mount /dev/mapper/enc /btrfs_tmp

      delete_subvolume_recursively() {
          IFS=$'\n'
          for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
              delete_subvolume_recursively "/btrfs_tmp/$i"
          done
          btrfs subvolume delete "$1"
      }

      # Remove the "root" subvolume if it exists
      if [[ -e /btrfs_tmp/root ]]; then
          delete_subvolume_recursively /btrfs_tmp/root
      fi

      # Create a new, empty "root" subvolume
      btrfs subvolume create /btrfs_tmp/root
      umount /btrfs_tmp  
    '';

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/sops-nix"
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
    ];
    files = [ "/etc/machine-id" ];
  };

  programs.fuse.userAllowOther = true;

  system.activationScripts.persistent-dirs.text = let
    mkHomePersist = user:
      lib.optionalString user.createHome # sh
      ''
        mkdir -p /persist/${user.home}
        chown ${user.name}:${user.group} /persist/${user.home}
        chmod ${user.homeMode} /persist/${user.home}
      '';
    users = lib.attrValues config.users.users;
  in lib.concatLines (map mkHomePersist users);
}
