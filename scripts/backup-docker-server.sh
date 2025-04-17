#!/bin/bash

# Set environment variables
export RESTIC_REPOSITORY="/mnt/windows-server/restic"
export RESTIC_PASSWORD="your-repo-password" # todo: actually use an environment variable.

# Stop the gitea service
echo "Stopping gitea service..."
systemctl stop gitea

# Stop the docker service
echo "Stopping docker service..."
systemctl stop docker

# Back up docker data, excluding images
echo "Backing up docker data..."
restic backup /var/lib/docker --exclude /var/lib/docker/images/*

# Back up gitea data
echo "Backing up gitea data..."
restic backup /var/lib/gitea

# prune old snapshots
echo "Pruning old snapshots..."
restic forget --keep-last 7 --prune

# Restart the docker service
echo "Restarting docker service..."
systemctl start docker

# Restart the gitea service
echo "Restarting gitea service..."
systemctl start gitea
