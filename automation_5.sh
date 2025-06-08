#!/bin/bash

# This script demonstrates a simple automation task:
# 1. Creates a new directory for logs.
# 2. Generates a timestamped log file within that directory.
# 3. Writes some sample content to the log file.
# 4. Cleans up by removing the log directory and its contents.

# --- Configuration ---
LOG_DIR="automation_logs"
LOG_FILE_PREFIX="task_log"
CURRENT_DATE=$(date +"%Y%m%d_%H%M%S") # Format: YYYYMMDD_HHMMSS

# --- Functions ---

# Function to create the log directory
create_log_directory() {
    echo "Creating log directory: $LOG_DIR"
    mkdir -p "$LOG_DIR" # -p creates parent directories if they don't exist
    if [ $? -eq 0 ]; then
        echo "Log directory created successfully."
    else
        echo "Error: Failed to create log directory. Exiting."
        exit 1 # Exit with an error code
    fi
}

# Function to generate a timestamped log file
generate_log_file() {
    LOG_PATH="$LOG_DIR/$LOG_FILE_PREFIX-$CURRENT_DATE.txt"
    echo "Generating log file: $LOG_PATH"
    echo "Automation script started at $CURRENT_DATE" > "$LOG_PATH"
    echo "-----------------------------------" >> "$LOG_PATH"
    echo "This is a sample log entry." >> "$LOG_PATH"
    echo "Another line for demonstration." >> "$LOG_PATH"
    if [ $? -eq 0 ]; then
        echo "Log file generated and content written successfully."
    else
        echo "Error: Failed to write to log file. Exiting."
        exit 1
    fi
}

# Function to display log file content (optional)
display_log_content() {
    echo "--- Content of $LOG_PATH ---"
    cat "$LOG_PATH"
    echo "--- End of log content ---"
}

# Function to clean up created files and directories
cleanup_automation() {
    echo "Cleaning up: Removing $LOG_DIR directory..."
    rm -rf "$LOG_DIR" # -r for recursive, -f for force (no prompt)
    if [ $? -eq 0 ]; then
        echo "Cleanup successful."
    else
        echo "Error: Failed to clean up log directory."
    fi
}

# --- Main execution flow ---

echo "--- Starting Automation Script ---"

# Step 1: Create log directory
create_log_directory

# Step 2: Generate log file
generate_log_file

# Step 3: (Optional) Display content
display_log_content

echo "Script paused for 3 seconds before cleanup..."
sleep 3
# Pause for a few seconds so you can see the created files

# Step 4: Clean up
cleanup_automation

echo "--- Automation Script Finished ---"

# Exit successfully
exit 0

