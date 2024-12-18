#!/bin/bash

# Step 1: Picking partitions
echo "Listing available partitions..."
AVAILABLE_PARTITIONS=$(lsblk -no NAME,SIZE,TYPE,MODEL | grep 'part' | awk '{gsub(/^[├└]─/, ""); print NR ". " $1 " (" $2 ", " $3 ($4 ? ", " $4 : "") ")"}')

# Display available partitions
echo "$AVAILABLE_PARTITIONS"
echo "Please select a partition by entering its number:"
read -r PARTITION_NUMBER

# Verify a valid number was selected
if ! [[ "$PARTITION_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Invalid selection. Exiting."
    exit 1
fi

# Extract the selected partition
SELECTED_PARTITION=$(echo "$AVAILABLE_PARTITIONS" | awk -v num="$PARTITION_NUMBER" 'NR==num {print $2}' | tr -d '()')
if [ -z "$SELECTED_PARTITION" ]; then
    echo "ERROR: No valid partition selected. Exiting."
    exit 1
fi

# Output the selected partition
PARTITION="/dev/$SELECTED_PARTITION"
echo "You selected: $PARTITION"

# Step 2: Ask for the passphrase and unlock the partition
echo "Please enter the passphrase to unlock the partition:"
read -s -r PASSPHRASE

# Check if the device is already unlocked (exists in /dev/mapper/)
if sudo cryptsetup status USBwithSSH &>/dev/null; then
    echo "The device is already unlocked. Proceeding to mount."
else
    # Use the passphrase to unlock the partition
    if echo "$PASSPHRASE" | sudo cryptsetup -q luksOpen /dev/$SELECTED_PARTITION USBwithSSH; then
        echo "The disk has been successfully unlocked."
    else
        echo "Failed to unlock the disk. Please check the passphrase and try again."
        exit 1
    fi
fi

# Step 3: Create a mount point and mount the unlocked USB
echo "Creating mount point..."
sudo mkdir -p /mnt/encrypted-storage

# Mount the unlocked USB
echo "Mounting the unlocked USB..."
sudo mount /dev/mapper/USBwithSSH /mnt/encrypted-storage

# Confirm the mount
if mount | grep -q '/mnt/encrypted-storage'; then
    echo "The USB drive has been successfully mounted at /mnt/encrypted-storage."
else
    echo "Failed to mount the USB drive. Exiting."
    exit 1
fi

# Step 4: List folders in /mnt/encrypted-storage and prompt to pick one (excluding lost+found)
echo "Listing folders in /mnt/encrypted-storage..."

# Use find to list directories and exclude lost+found
FOLDER_LIST=$(find /mnt/encrypted-storage -mindepth 1 -maxdepth 1 -type d ! -name 'lost+found' | xargs -n 1 basename | awk '{print NR ". " $0}')

# Display available folders
echo "$FOLDER_LIST"
echo "Please select a folder by entering its number:"
read -r FOLDER_NUMBER

# Verify a valid number was selected
if ! [[ "$FOLDER_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Invalid selection. Exiting."
    exit 1
fi

# Extract the selected folder
SELECTED_FOLDER=$(echo "$FOLDER_LIST" | awk -v num="$FOLDER_NUMBER" 'NR==num {print $2}')
if [ -z "$SELECTED_FOLDER" ]; then
    echo "ERROR: No valid folder selected. Exiting."
    exit 1
fi

# Confirm the selected folder
echo "You selected the folder: $SELECTED_FOLDER"

# Step 5: Copy SSH host keys to /etc/ssh
echo "Copying SSH host keys from $SELECTED_FOLDER to /etc/ssh/"

# Copy the SSH host keys to /etc/ssh using sudo
sudo cp -av "/mnt/encrypted-storage/$SELECTED_FOLDER/ssh_host"* /etc/ssh/

# Confirm the copy was successful
if [ $? -eq 0 ]; then
    echo "SSH host keys have been successfully copied to /etc/ssh/."
else
    echo "Failed to copy SSH host keys. Exiting."
    exit 1
fi
