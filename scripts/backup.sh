#!/bin/bash

set -e

BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/nexvion_backup_$TIMESTAMP.tar.gz"

echo "Creating Nexvion application backup..."

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" \
    index.html \
    products.html \
    payment.html \
    style.css \
    products.css \
    payment.css \
    script.js \
    payment.js \
    logo.png

echo "Backup created successfully:"
echo "$BACKUP_FILE"