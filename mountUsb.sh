#!/bin/bash

# Step 1: Picking a partition
echo "Listing available partitions..."
AVAILABLE_PARTITIONS=$(lsblk -no NAME,SIZE,TYPE,MODEL | grep 'part' | awk '{gsub(/^[├└]─/, ""); print NR ". " $1 " (" $2 ", " $3 ($4 ? ", " $4 : "") ")"}')

if [ -z "$AVAILABLE_PARTITIONS" ]; then
    echo "ERROR: No partitions found. Exiting."
    exit 1
fi

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

PARTITION="/dev/$SELECTED_PARTITION"
echo "You selected: $PARTITION"

# Step 2: Check if partition is already mounted
MOUNT_POINT="/mnt/usb"
if mount | grep -q "$PARTITION"; then
    echo "ERROR: $PARTITION is already mounted. Please unmount it before proceeding."
    exit 1
fi

# Step 3: Create the mount point if it doesn't exist
if [ ! -d "$MOUNT_POINT" ]; then
    echo "Creating mount point at $MOUNT_POINT..."
    mkdir -p "$MOUNT_POINT" || { echo "ERROR: Failed to create mount point. Exiting."; exit 1; }
fi

# Step 4: Mount the partition
echo "Mounting $PARTITION to $MOUNT_POINT..."
if ! sudo mount "$PARTITION" "$MOUNT_POINT"; then
    echo "ERROR: Failed to mount $PARTITION to $MOUNT_POINT."
    exit 1
fi

echo "$PARTITION has been successfully mounted to $MOUNT_POINT."

# Step 5: Display mount point information
echo "Mounted partitions:"
lsblk | grep "$MOUNT_POINT"
