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
