## Installation

### Base

1. Download NixOS iso file from official site
2. Run VM with that ISO. Don't forget to turn on UEFI-4d in virt manager
3. Clone the repo
4. Partition disk with `partitionWithDisko.sh`
5. `sudo nixos-install --flake .#vm` and reboot
6. After reboot change password with `passwd boticelli`
7. `nix-shell -p home-manager git`
8. Clone the repo again
9. `home-manager switch --flake .#boticelli@vm`

### Impermanence

