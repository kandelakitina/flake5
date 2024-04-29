#!/bin/bash

# Define the URL of the GitHub repository
REPO_URL="https://api.github.com/repos/kandelakitina/wallpapers/contents/"

# Define the target directory
TARGET_DIR="$HOME/.local/share/backgrounds"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download files from the repository
curl -sSL "$REPO_URL" | grep -o '"download_url": "[^"]*"' | cut -d'"' -f4 | while read -r DOWNLOAD_URL; do
    FILE_NAME=$(basename "$DOWNLOAD_URL")
    if [ ! -f "$TARGET_DIR/$FILE_NAME" ]; then
        curl -sSL "$DOWNLOAD_URL" -o "$TARGET_DIR/$FILE_NAME"
    fi
done

echo "Files downloaded to $TARGET_DIR"
