#!/bin/bash

# 1. Run lsblk
echo "Available disks:"
lsblk

# 2. Ask for the disk name from lsblk (after /dev/)
read -p "Enter the disk name (after /dev/): " disk_name

# 3. Show the list of files from ./diskoConfigs/
echo "Available disko configuration files:"
files=("./diskoConfigs/"*)
for i in "${!files[@]}"; do
  printf "%d) %s\n" "$((i + 1))" "${files[$i]##*/}"
done

# 4. Ask for the number of the file from ./diskoConfigs/
read -p "Enter the number of the file you want to use: " file_number

# Validate file selection
if ! [[ "$file_number" =~ ^[0-9]+$ ]] || [ "$file_number" -lt 1 ] || [ "$file_number" -gt "${#files[@]}" ]; then
  echo "Invalid file number selected. Exiting."
  exit 1
fi

selected_file="${files[$file_number - 1]}"

# 5. Run the following script
command="sudo nix --experimental-features \"nix-command flakes\" run github:nix-community/disko -- --mode disko ${selected_file} --arg device '\"/dev/${disk_name}\"'"
echo "Running command: $command"
eval "$command"

# 6. Check results
lsblk