#!/bin/bash

# Set the directory you want to serve
FOLDER_PATH="/workspaces/Automation"
PORT=8000  # You can change this to any available port

# Navigate to the folder
cd "$FOLDER_PATH" || { echo "Folder not found!"; exit 1; }

# Install 'serve' globally if not already installed
if ! command -v serve &> /dev/null; then
    echo "'serve' not found. Installing..."
    npm install -g serve || { echo "Failed to install 'serve'"; exit 1; }
fi

# Start the HTTP server
serve -l $PORT
