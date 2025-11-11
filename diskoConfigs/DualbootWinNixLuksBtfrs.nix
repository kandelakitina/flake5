{ device ? "/dev/nvme0n1", ... }: {
  disko.devices = {
    disk.main = {
      inherit device;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            label = "EFI";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "defaults" ];
            };
          };

          MSR = {
            size = "128M";
            type = "0C01"; # Microsoft reserved partition
          };

          nixos = {
            label = "luks";
            size = "150G"; # or adjust to taste
            type = "8300";
            content = {
              type = "luks";
              name = "enc";
              extraOpenArgs = [
                "--allow-discards"
                "--perf-no_read_workqueue"
                "--perf-no_write_workqueue"
              ];
              content = {
                type = "btrfs";
                extraArgs = [ "-L" "nixos" "-f" ];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ];
                  };
                  "/persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ];
                  };
                  "/log" = {
                    mountpoint = "/var/log";
                    mountOptions = [ "subvol=log" "compress=zstd" "noatime" ];
                  };
                };
              };
            };
          };

          windows = {
            label = "Windows";
            size = "100%";
            type = "0700"; # Microsoft basic data
            # Leave unformatted so Windows installer can format NTFS
          };
        };
      };
    };
  };

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
  fileSystems."/etc/ssh".neededForBoot = true;
  fileSystems."/var/lib/sops-nix".neededForBoot = true;
}
