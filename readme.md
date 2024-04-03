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

Impermanence is added by default. But `/home` is mounted separately from `/root` in disko configuration, so `/home` is always persistent.

### Nix colors

Nix-colors allows setting color options and them usem them in config. Colorschemes are defined in `home-manager/user/host.nix`, i.e. as part of home manager options, under `colorscheme` variable. I store my custom colorschemes in `modules/home-manager/colorschemes`.

### Fish

Don't forget to turn on default shell for your user in `  users.users.boticelli.shell = pkgs.fish;`

### Alacritty

Alacritty have a weird requirement for the naming of Ubuntu terminal font - `UbuntuMono Nerd Font`