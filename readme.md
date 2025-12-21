# Boticelli's Flake Config 5

A comprehensive, flake-driven NixOS and Home-Manager configuration repository for managing multiple hosts with modularity, impermanence, and modern tooling.

## Overview

This repository provides declarative configurations for NixOS systems and Home-Manager user environments. It supports multiple hosts (beelink, minisforum, vm, iso), features impermanence for ephemeral roots, encrypted secrets via SOPS, theming with Nix-colors, and a rich set of modules for tools like Hyprland, Helix, and AI assistants.

Key technologies:
- **Nix Flakes**: For reproducible builds and dependency management.
- **NixOS**: System-level configuration.
- **Home-Manager**: User environment management.
- **Disko**: Declarative disk partitioning.
- **Impermanence**: Ephemeral root filesystem with persistent data.
- **SOPS**: Encrypted secrets management.

## Prerequisites

- A compatible system (x86_64-linux).
- Basic knowledge of Nix and NixOS.
- For installation: A NixOS ISO (download from [nixos.org](https://nixos.org/download.html)).
- Optional: YubiKey for hardware security, age keys for SOPS.

## Installation

### General Steps

1. Boot into NixOS live ISO (enable UEFI in virtualization if applicable).
2. Clone this repository: `git clone https://github.com/yourusername/flake5.git` (replace with actual repo URL).
3. Partition the disk using Disko: `./partitionWithDisko.sh` (select appropriate config from `diskoConfigs/`).
4. Install NixOS: `sudo nixos-install --flake .#<host>` (e.g., `.#beelink`).
5. Reboot into the new system.
6. Set user password: `passwd boticelli`.
7. Install Home-Manager: `nix-shell -p home-manager git`.
8. Re-clone the repo and switch Home-Manager: `home-manager switch --flake .#boticelli@<host>`.

### Host-Specific Installation

#### VM (Virtual Machine)
- Use `partitionWithDisko.sh` with default config.
- Install with `sudo nixos-install --flake .#vm`.
- Follow general steps above.

#### Beelink (Physical Host)
- Ensure hardware compatibility (check `hosts/beelink/hardware-configuration.nix`).
- Use Disko for partitioning (e.g., LUKS-encrypted Btrfs).
- Install with `sudo nixos-install --flake .#beelink`.
- Post-install: Enable impermanence and persist critical data.

#### Minisforum (Physical Host)
- Similar to Beelink; adjust hardware config as needed.
- Install with `sudo nixos-install --flake .#minisforum`.

#### ISO (Live Environment)
- Build ISO: `nix build .#nixosConfigurations.iso.config.system.build.isoImage`.
- Use for testing or installation on new machines.

### Post-Installation Setup

- **Impermanence**: Root is ephemeral; `/home` and `/persist` are persistent. Data like SSH keys and logs are auto-persisted.
- **Secrets**: Decrypt SOPS secrets: Ensure `.sops.yaml` and `secrets.yaml` are configured with your keys.
- **Theming**: Colorschemes are set in `home-manager/boticelli/<host>.nix` via Nix-colors.
- **Shell**: Fish is set as default shell; ensure `users.users.boticelli.shell = pkgs.fish;` in NixOS config.
- **Fonts**: Alacritty requires exact font names (e.g., `UbuntuMono Nerd Font`).

## Configuration Structure

- **`flake.nix`**: Defines inputs (e.g., nixpkgs, home-manager) and outputs (configs, packages, templates).
- **`hosts/`**: NixOS configurations per host (e.g., `beelink/default.nix` imports modules and sets hardware).
- **`home-manager/boticelli/`**: User configs (e.g., `beelink.nix` for host-specific settings).
- **`modules/`**: Reusable modules.
  - `modules/nixos/`: System modules (e.g., `hyprland.nix`, `sops.nix`).
  - `modules/home-manager/`: User modules (e.g., `helix/`, `scripts/`).
- **`diskoConfigs/`**: Disk partitioning configs (e.g., `luksBtfrs.nix` for encrypted Btrfs).
- **`overlays/`**: Nixpkgs overlays for custom packages.
- **`pkgs/`**: Custom package definitions.
- **`templates/`**: Flake templates for new projects (e.g., Node.js, Rails).
- **`keys/`**: Public keys (SSH, PGP).
- **`images/` & `misc/`**: Wallpapers and miscellaneous files.

## Modules

### NixOS Modules (`modules/nixos/`)

- **`hyprland.nix`**: Hyprland window manager with bindings, animations, and integrations.
- **`sops.nix`**: SOPS for secrets (e.g., WiFi passwords, API keys).
- **`impermanence.nix`**: Ephemeral root with persistent directories.
- **`yubikey.nix`**: Hardware security key support.
- **`v2ray.nix` & `amnezia.nix`**: VPN and proxy configurations.
- **`gnome.nix`, `xfce.nix`**: Alternative desktop environments.
- **`sound.nix`, `bluetooth.nix`**: Audio and Bluetooth setup.
- **`ssh.nix`**: SSH server configuration.
- **`users/boticelli.nix`**: User definition with groups and shell.

### Home-Manager Modules (`modules/home-manager/`)

- **`helix/`**: Helix editor with language servers (e.g., `biome.toml` for JS, `ruby.toml`).
- **`hyprland/`**: User-level Hyprland config (waybar, dunst, pyprland).
- **`AI/`**: AI tools (`aichat.nix`, `goose.nix`, `sgpt.nix`).
- **`scripts/`**: Custom scripts (e.g., `pomodoro.sh`, `mountEncryptedUsb.sh`).
- **`zellij/`**: Terminal multiplexer with themes.
- **`colorschemes/`**: Custom themes (e.g., `dracula.nix`).
- **`firefox.nix`**: Firefox with addons and GNOME theme.
- **`fish.nix`**: Fish shell config with aliases and functions.
- **`git.nix`**: Git setup with lazygit.
- **`starship.nix`**: Shell prompt customization.
- **`wallpaper.nix`**: Wallpaper management.
- Other: `alacritty.nix`, `mpv.nix`, `obsidian.nix`, etc.

Modules are imported conditionally in host configs for flexibility.

## Templates

Use `nix flake init -t .#<template>` to scaffold projects:

- **`basic`**: Minimal Nix flake.
- **`node`**: Node.js project with flake and justfile.
- **`rails`**: Ruby on Rails with Tailwind and Procfile.
- **`deno`**: Deno setup.
- **`ruby`**: Basic Ruby flake.

## Key Features

### Impermanence
- Root filesystem is wiped on reboot; `/persist` and `/home` retain data.
- Configured in `modules/nixos/impermanence.nix` and Home-Manager persistence.

### Secrets Management (SOPS)
1. Install SOPS: `nix-shell -p sops`.
2. Generate age key: `age-keygen -o ~/.config/sops/age/keys.txt`.
3. Edit `.sops.yaml` with your public key.
4. Encrypt secrets: `sops --encrypt secrets.yaml > secrets.enc.yaml`.
5. Decrypt in configs via `config.sops.secrets.<name>.path`.

### Theming with Nix-Colors
- Set `colorscheme` in Home-Manager (e.g., `colorschemes.dracula`).
- Applied to Hyprland borders, Helix syntax, etc.
- Custom schemes in `modules/home-manager/colorschemes/`.

### Hyprland Desktop
- Wayland compositor with custom keybindings, animations, and plugins.
- Integrates with waybar, dunst, and pyprland for a full DE experience.

### AI and Productivity Tools
- AI assistants: ShellGPT, Goose, aichat.
- Editors: Helix with LSPs.
- Multiplexers: Zellij.
- Scripts: Automation for common tasks.

## Usage

- **Switch Configs**: `sudo nixos-rebuild switch --flake .#<host>` for system; `home-manager switch --flake .#boticelli@<host>` for user.
- **Update**: `nix flake update` to refresh inputs.
- **Dev Shell**: `nix develop` for development environment.
- **Packages**: `nix build .#<package>` for custom packages.
- **Formatter**: `nix fmt` to format Nix files.

## Troubleshooting

- **Partitioning Issues**: Ensure Disko config matches hardware; run `sudo nixos-generate-config` if needed.
- **Impermanence**: If data is lost, check `/persist` mounts in `diskoConfigs/`.
- **SOPS Errors**: Verify age keys and `.sops.yaml`.
- **Hyprland**: Check logs with `journalctl -u hyprland`.
- **Fonts**: Install Nerd Fonts system-wide if Alacritty complains.
- **VM Issues**: Enable KVM and UEFI in virt-manager.

## Contributing

- Fork and submit PRs.
- Follow Nix formatting: `nix fmt`.
- Test changes on a VM first.

## License

MIT or as specified in flake inputs.

For more details, explore the code or check Nix documentation.
