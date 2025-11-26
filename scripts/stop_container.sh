#!/bin/bash
set -e

echo "Stopping old container..."

docker stop new-web-app || true
docker rm new-web-app || true
