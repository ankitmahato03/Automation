#!/bin/bash

# Folder to back up
# Folder to back up
SOURCE_DIR="$HOME/Documents"

# Backup destination
DEST="$HOME/backup_$(date +%F).tar.gz"

# Create backup
tar -czf "$DEST" "$SOURCE_DIR"

echo "Backup saved to $DEST"


#this is a single line comment 

