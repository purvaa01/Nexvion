#!/bin/bash

set -e

BACKUP_DIR="backups"

echo "Cleaning up Nexvion temporary files..."

if [ -d "$BACKUP_DIR" ]; then
    rm -rf "$BACKUP_DIR"
    echo "Backup directory removed successfully."
else
    echo "No backup directory found. Nothing to clean."
fi

echo "Cleanup completed successfully."
