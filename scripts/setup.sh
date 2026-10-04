#!/bin/bash

set -e

echo "Setting up Nexvion environment..."

echo "Checking required files..."

required_files=(
    "index.html"
    "products.html"
    "payment.html"
    "style.css"
    "products.css"
    "payment.css"
    "script.js"
    "payment.js"
)

for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: Required file not found: $file"
        exit 1
    fi
done

echo "All required application files are present."
echo "Nexvion environment setup completed successfully."