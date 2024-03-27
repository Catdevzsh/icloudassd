#!/bin/bash

# Prompt for sudo if not already running as root
[ "$(id -u)" != "0" ] && echo "This script requires superuser access. Please run with sudo." && exit 1

# Define local and iCloud directories
LOCAL_DIR="$HOME"
ICLOUD_DIR="$HOME/Library/Mobile Documents"

# Simplified loop to move directories and create symbolic links
for dir in Documents Desktop Downloads Pictures Music Movies; do
    [ -d "$LOCAL_DIR/$dir" ] && sudo mv "$LOCAL_DIR/$dir" "$ICLOUD_DIR/" && sudo ln -s "$ICLOUD_DIR/$dir" "$LOCAL_DIR/$dir"
done

echo "Simplified migration to iCloud complete with elevated privileges."
## [C ] - Flames Co. 20XX-25