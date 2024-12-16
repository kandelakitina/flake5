{ config, lib, inputs, ... }:
let removeTmpFilesOlderThan = 14;
in {
  imports = [ inputs.impermanence.nixosModules.impermanence ];

boot.initrd.postDeviceCommands = ''
  # Define root mountpoint
  mkdir -p /btrfs_tmp

  # Wait for root device to be available
  until [ -e /dev/mapper/cryptroot ]; do
      echo "Waiting for /dev/mapper/cryptroot to be ready..."
      sleep 1
  done

  # Mount the root Btrfs filesystem
  mount /dev/mapper/cryptroot /btrfs_tmp || {
      echo "Failed to mount /dev/mapper/cryptroot"
      exit 1
  }

  # Handle old root subvolume
  if [[ -e /btrfs_tmp/root ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%d_%H:%M:%S")
      mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
  fi

  # Recursive Btrfs subvolume deletion
  delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
          delete_subvolume_recursively "/btrfs_tmp/$i"
      done
      btrfs subvolume delete "$1"
  }

  # Clean up old roots older than the specified age
  for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -type d -mtime +${builtins.toString removeTmpFilesOlderThan}); do
      delete_subvolume_recursively "$i"
  done

  # Create a fresh root subvolume
  btrfs subvolume create /btrfs_tmp/root || {
      echo "Failed to create Btrfs root subvolume"
      exit 1
  }

  # Unmount and cleanup
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
      lib.optionalString user.createHome ''
        mkdir -p /persist/${user.home}
        chown ${user.name}:${user.group} /persist/${user.home}
        chmod ${user.homeMode} /persist/${user.home}
      '';
    users = lib.attrValues config.users.users;
  in lib.concatLines (map mkHomePersist users);
}
