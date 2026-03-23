#!/bin/bash

# Set environment variables
export USB_DRIVE_REPO="/mnt/usb-drive/restic"
export MACMINI_REPO="/mnt/macmini/restic"
export RESTIC_PASSWORD="your-repo-password" # todo: actually use an environment variable.


# Stop the gitea service
echo "Stopping gitea service..."
systemctl stop gitea


# Stop the docker service
echo "Stopping docker service..."
systemctl stop docker


# Back up docker volume data
echo "Backing up docker data to usb-drive..."
restic backup /home/docker/volumes --repo $USB_DRIVE_REPO

echo "Backing up docker data to macmini..."
restic backup /home/docker/volumes --repo $MACMINI_REPO


# TODO: Ensure there isn't any other docker-related data to back up!!


# Back up gitea data
echo "Backing up gitea data to usb-drive..."
restic backup /var/lib/gitea --repo $USB_DRIVE_REPO

echo "Backing up gitea data to macmini..."
restic backup /var/lib/gitea --repo $MACMINI_REPO


# prune old snapshots
echo "Pruning old snapshots from usb-drive..."
restic forget --keep-last 7 --prune --repo $USB_DRIVE_REPO

echo "Pruning old snapshots from macmini..."
restic forget --keep-last 7 --prune --repo $MACMINI_REPO


# Restart the docker service
echo "Restarting docker service..."
systemctl start docker


# Restart the gitea service
echo "Restarting gitea service..."
systemctl start gitea
