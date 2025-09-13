#!/bin/bash
# Partition, format, mount, and prepare folders

DISK="/dev/sda"

echo ">>> WARNING: This will ERASE all data on $DISK"
read -p "Type YES to continue: " confirm
[ "$confirm" != "YES" ] && { echo "Aborted."; exit 1; }

# Unmount any existing partitions
sudo umount ${DISK}? 2>/dev/null

# Partition the disk
sudo parted --script "$DISK" mklabel msdos
sudo parted --script "$DISK" mkpart primary ext4 0% 100%

# Format
sudo mkfs.ext4 -F ${DISK}1

# Create and mount
sudo mkdir -p /mnt/external
sudo mount ${DISK}1 /mnt/external

# Make mount persistent
UUID=$(sudo blkid -s UUID -o value ${DISK}1)
grep -q "$UUID" /etc/fstab || \
  echo "UUID=$UUID /mnt/external ext4 defaults 0 2" | sudo tee -a /etc/fstab

# Prepare appdata dirs
sudo mkdir -p /mnt/external/appdata
sudo chown -R 1000:1000 /mnt/external/appdata
sudo chmod -R 755 /mnt/external/appdata

echo ">>> Disk ready and mounted at /mnt/external"
