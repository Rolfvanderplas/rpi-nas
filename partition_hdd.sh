#!/bin/bash

# Disk device to partition (adjust as needed)
DISK="/dev/sda"

# Create a new MSDOS partition table
sudo parted --script $DISK mklabel msdos

# Create first partition from 0% to 50%
sudo parted --script $DISK mkpart primary ext4 0% 50%

# Create second partition from 50% to 100%
sudo parted --script $DISK mkpart primary ext4 50% 100%

# Inform user partitions created
echo "Two equal partitions created on $DISK"

# Format the partitions with ext4 filesystem (adjust partition names if needed)
sudo mkfs.ext4 ${DISK}1
sudo mkfs.ext4 ${DISK}2

echo "Partitions formatted with ext4."
