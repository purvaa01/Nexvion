#!/bin/bash

PORT=${PORT:-8000}
URL="http://localhost:$PORT"

echo "Checking Nexvion application health..."

if curl -fsS "$URL" > /dev/null; then
    echo "Nexvion application is healthy."
    exit 0
else
    echo "Nexvion application is not responding."
    exit 1
fi