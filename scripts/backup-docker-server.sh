#!/bin/bash

# Set environment variables
export USB_DRIVE_REPO="/mnt/usb-drive/restic"
export WINDOWS_SERVER_REPO="/mnt/windows-server/restic"
export RESTIC_PASSWORD="your-repo-password" # todo: actually use an environment variable.


# Stop the gitea service
echo "Stopping gitea service..."
systemctl stop gitea


# Stop the docker service
echo "Stopping docker service..."
systemctl stop docker


# Back up docker data, excluding images
echo "Backing up docker data to usb-drive..."
restic backup /home/docker --repo $USB_DRIVE_REPO --exclude /home/docker/images/*

echo "Backing up docker data to windows-server..."
restic backup /home/docker --repo $WINDOWS_SERVER_REPO --exclude /home/docker/images/*


# Back up gitea data
echo "Backing up gitea data to usb-drive..."
restic backup /var/lib/gitea --repo $USB_DRIVE_REPO

echo "Backing up gitea data to windows-server..."
restic backup /var/lib/gitea --repo $WINDOWS_SERVER_REPO


# prune old snapshots
echo "Pruning old snapshots from usb-drive..."
restic forget --keep-last 7 --prune --repo $USB_DRIVE_REPO

echo "Pruning old snapshots from windows-server..."
restic forget --keep-last 7 --prune --repo $WINDOWS_SERVER_REPO


# Restart the docker service
echo "Restarting docker service..."
systemctl start docker


# Restart the gitea service
echo "Restarting gitea service..."
systemctl start gitea
