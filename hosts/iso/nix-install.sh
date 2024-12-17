#!/usr/bin/env bash
set -euo pipefail

# Step 1: Clone dotfiles repository if not already present
DOTFILES_DIR="$HOME/flake5"
if [ ! -d "$DOTFILES_DIR/.git" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/kandelakitina/flake5.git "$DOTFILES_DIR"
fi

# Step 2: List all block devices and prompt the user to pick one
echo "Listing available drives..."
AVAILABLE_DRIVES=$(lsblk -dno NAME,SIZE,TYPE | grep 'disk' | awk '{print $1 " (" $2 ")"}')

# Use gum to pick a drive
SELECTED_DRIVE=$(echo "$AVAILABLE_DRIVES" | gum choose | awk '{print $1}')

# Verify a drive was selected
if [ -z "$SELECTED_DRIVE" ]; then
    echo "ERROR: No drive selected. Exiting."
    exit 1
fi

# Step 3: List available disko configuration files
echo "Listing available disko configuration files..."
CONFIG_DIR="$DOTFILES_DIR/diskoConfigs"
CONFIG_FILE=$(find "$CONFIG_DIR" -type f -name '*.nix' | sed 's|.*/||' | gum choose)

# Verify a configuration file was selected
if [ -z "$CONFIG_FILE" ]; then
    echo "ERROR: No configuration file selected. Exiting."
    exit 1
fi

CONFIG_PATH="$CONFIG_DIR/$CONFIG_FILE"

# Step 4: List available NixOS host configurations and pick one
echo "Listing available NixOS host configurations..."
HOSTS_DIR="$DOTFILES_DIR/hosts"
SELECTED_HOST=$(find "$HOSTS_DIR" -maxdepth 1 -mindepth 1 -type d | sed 's|.*/||' | gum choose)

# Verify a host configuration was selected
if [ -z "$SELECTED_HOST" ]; then
    echo "ERROR: No host configuration selected. Exiting."
    exit 1
fi

# Step 5: Confirmation - Warn the user that all data will be erased
gum confirm --default=false \
"🔥 WARNING!!!! All data on /dev/$SELECTED_DRIVE will be ERASED using configuration $CONFIG_FILE and host $SELECTED_HOST. Are you sure you want to continue?"

# Step 6: Partitioning the drive
echo "Partitioning /dev/$SELECTED_DRIVE with $CONFIG_FILE..."
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
    --mode disko "$CONFIG_PATH" --arg device "\"/dev/$SELECTED_DRIVE\""

# Step 7: NixOS installation
echo "Installing NixOS for host configuration: $SELECTED_HOST..."
sudo nixos-install --flake "$DOTFILES_DIR#$SELECTED_HOST"

echo "✅ NixOS installation complete on /dev/$SELECTED_DRIVE with configuration $CONFIG_FILE and host $SELECTED_HOST!"

# Step 8: Suggest reboot
echo "🔄 Installation complete. It is recommended to reboot your system now."
gum confirm "Would you like to reboot now?" && sudo reboot
