#!/bin/bash

set -e

PORT=${PORT:-8000}

echo "Starting Nexvion application..."
echo "Application will be available on port $PORT"

python3 -m http.server "$PORT"