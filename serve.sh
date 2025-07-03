#!/bin/bash

# Set the directory you want to serve
FOLDER_PATH="/workspaces/Automation/ankit.txt"


# Navigate to the folder
cd "$FOLDER_PATH" || exit

# Start the HTTP server
serve
