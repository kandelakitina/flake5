#!/usr/bin/env bash
set -euo pipefail

echo "=== Available block devices ==="
lsblk
echo

read -rp "Enter the disk name (e.g. nvme0n1): " disk_name
device="/dev/${disk_name}"

if [[ ! -b "$device" ]]; then
  echo "❌ Device $device does not exist"
  exit 1
fi

echo
echo "⚠️  WARNING: THIS WILL WIPE $device"
read -rp "Type YES to continue: " confirm
if [[ "$confirm" != "YES" ]]; then
  echo "Aborted."
  exit 1
fi

echo
echo "=== Available disko configuration files ==="
files=(./diskoConfigs/*)

if [[ ${#files[@]} -eq 0 ]]; then
  echo "❌ No disko configs found in ./diskoConfigs/"
  exit 1
fi

for i in "${!files[@]}"; do
  printf "%d) %s\n" "$((i + 1))" "$(basename "${files[$i]}")"
done

echo
read -rp "Enter the number of the file to use: " file_number

if ! [[ "$file_number" =~ ^[0-9]+$ ]] \
   || (( file_number < 1 || file_number > ${#files[@]} )); then
  echo "❌ Invalid selection"
  exit 1
fi

selected_file="${files[$((file_number - 1))]}"

echo
echo "=== Selected configuration ==="
echo "Device: $device"
echo "Config: $selected_file"
echo

### Phase 1: Partition & format
echo "=== Running disko (partition + format) ==="
sudo nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko \
  -- --mode disko "$selected_file" --arg device "\"$device\""

echo
echo "=== Disk layout after formatting ==="
lsblk
echo

### Phase 2: Mount
echo "=== Mounting filesystems ==="
sudo nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko \
  -- --mode mount "$selected_file" --arg device "\"$device\""

echo
echo "=== Mounted filesystems ==="
lsblk -f
echo
mount | grep /mnt || true
echo
df -h | grep /mnt || true

echo
echo "✅ Disk prepared and mounted at /mnt"
echo "👉 You can now run:"
echo "   nixos-generate-config --root /mnt"
echo "   nixos-install"

