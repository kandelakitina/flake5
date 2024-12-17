#!/bin/bash

list_block_devices() {
    lsblk
}

mount_usb() {
    read -p "Enter the disk drive of the USB stick (e.g., sdb1): " device
    mount_point="/mnt/usb"
    sudo mkdir -p "$mount_point"
    if sudo mount "/dev/$device" "$mount_point"; then
        echo "USB stick mounted at $mount_point"
        cd "$mount_point" || echo "Failed to change directory to $mount_point"
    else
        echo "Failed to mount the USB stick. Please check the device and mount point."
    fi
}

list_block_devices
mount_usb
