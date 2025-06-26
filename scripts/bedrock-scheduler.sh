#!/bin/bash

#REPO_URL="https://gitea.bluesaltlabs.com/BlueSaltLabs/bedrock"
#REPO_URL="git@gitea.bluesaltlabs.com:BlueSaltLabs/bedrock.git"
REPO_URL="git@docker-server.local:BlueSaltLabs/bedrock.git"
REPO_PATH="/scraper"
WORK_DIR="/root/projects/bedrock"


# 1. Output script start time to log.
echo "Starting Bedrock Scheduler..."

# 2. Ensure docker is running. If it is not, log and exit
if ! docker info >/dev/null 2>&1; then
  echo "Docker is not running! exiting."
  exit 1
fi

# 3. Pull scraper code repo files (to ensure updates are added automatically).
# The commented out parts of this only had to run the first time
cd "$WORK_DIR"
#git init
#git remote add origin "$REPO_URL"
#git config core.sparseCheckout true
#echo "$REPO_PATH/*" > .git/info/sparse-checkout
git pull origin main

# 4. Build and run the docker container
cd "${WORK_DIR}${REPO_PATH}"
docker compose up --build

# 6. output  that the script has completed.
echo "Bedrock Scheduler run Complete."

## Todo: use this instead:
# https://stackoverflow.com/a/59587362
# docker compose
version: "3"
services:
  app:
    build: .
