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
AVAILABLE_DRIVES=$(lsblk -dno NAME,SIZE,TYPE | grep 'disk' | awk '{print NR ". " $1 " (" $2 ")"}')

# Display available drives
echo "$AVAILABLE_DRIVES"
echo "Please select a drive by entering its number:"
read -r DRIVE_NUMBER

# Verify a valid number was selected
if ! [[ "$DRIVE_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Invalid selection. Exiting."
    exit 1
fi

# Extract the selected drive
SELECTED_DRIVE=$(echo "$AVAILABLE_DRIVES" | awk -v num="$DRIVE_NUMBER" 'NR==num {print $2}' | tr -d '()')
if [ -z "$SELECTED_DRIVE" ]; then
    echo "ERROR: No valid drive selected. Exiting."
    exit 1
fi
device="/dev/$SELECTED_DRIVE"

# Step 3: List available disko configuration files
echo "Listing available disko configuration files..."
CONFIG_DIR="$DOTFILES_DIR/diskoConfigs"
CONFIG_FILES=$(find "$CONFIG_DIR" -type f -name '*.nix' | sed 's|.*/||')

# Prompt user to select a configuration file by number
echo "Available configuration files:"
CONFIG_FILES_ARRAY=($(echo "$CONFIG_FILES"))
for i in "${!CONFIG_FILES_ARRAY[@]}"; do
    echo "$((i + 1)). ${CONFIG_FILES_ARRAY[$i]}"
done
echo -n "Select a configuration file by number: "
read -r CONFIG_FILE_INDEX

# Verify a configuration file was selected
if [ -z "$CONFIG_FILE_INDEX" ] || [ "$CONFIG_FILE_INDEX" -lt 1 ] || [ "$CONFIG_FILE_INDEX" -gt "${#CONFIG_FILES_ARRAY[@]}" ]; then
    echo "ERROR: Invalid selection. Exiting."
    exit 1
fi
CONFIG_FILE="${CONFIG_FILES_ARRAY[$((CONFIG_FILE_INDEX - 1))]}"
CONFIG_PATH="$CONFIG_DIR/$CONFIG_FILE"

# Step 4: List available NixOS host configurations and pick one
echo "Listing available NixOS host configurations..."
HOSTS_DIR="$DOTFILES_DIR/hosts"
HOST_CONFIGS=$(find "$HOSTS_DIR" -maxdepth 1 -mindepth 1 -type d | sed 's|.*/||')

# Prompt user to select a host configuration by number
echo "Available host configurations:"
HOST_CONFIGS_ARRAY=($(echo "$HOST_CONFIGS"))
for i in "${!HOST_CONFIGS_ARRAY[@]}"; do
    echo "$((i + 1)). ${HOST_CONFIGS_ARRAY[$i]}"
done
echo -n "Select a host configuration by number: "
read -r SELECTED_HOST_INDEX

# Verify a host configuration was selected
if [ -z "$SELECTED_HOST_INDEX" ] || [ "$SELECTED_HOST_INDEX" -lt 1 ] || [ "$SELECTED_HOST_INDEX" -gt "${#HOST_CONFIGS_ARRAY[@]}" ]; then
    echo "ERROR: Invalid selection. Exiting."
    exit 1
fi
SELECTED_HOST="${HOST_CONFIGS_ARRAY[$((SELECTED_HOST_INDEX - 1))]}"

# Step 5: Confirmation - Warn the user that all data will be erased
echo "🔥 WARNING!!!! All data on $device will be ERASED using configuration $CONFIG_FILE and host $SELECTED_HOST."
echo -n "Are you sure you want to continue? (yes/no): "
read -r CONFIRMATION
if [ "$CONFIRMATION" != "yes" ]; then
    echo "Operation canceled."
    exit 1
fi

# Step 6: Partitioning the drive
echo "Partitioning $device with $CONFIG_FILE..."
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
    --mode disko "$CONFIG_PATH" --arg device "\"$device\""

# Step 7: NixOS installation
echo "Installing NixOS for host configuration: $SELECTED_HOST..."
sudo nixos-install --flake "$DOTFILES_DIR#$SELECTED_HOST"

echo "✅ NixOS installation complete on $device with configuration $CONFIG_FILE and host $SELECTED_HOST!"

# Step 8: Suggest reboot
echo "🔄 Installation complete. It is recommended to reboot your system now."
echo -n "Would you like to reboot now? (yes/no): "
read -r REBOOT_CONFIRMATION
if [ "$REBOOT_CONFIRMATION" == "yes" ]; then
    sudo reboot
fi
