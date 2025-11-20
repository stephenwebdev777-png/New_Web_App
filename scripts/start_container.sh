#!/bin/bash
set -e

# ------------------------
# Configuration
# ------------------------
REGION="us-east-1"
ACCOUNT_ID="390403865161"
REPOSITORY_NAME="new-web-app-repo"
IMAGE_URI="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:latest"

echo "Starting Deployment..."

# ------------------------
# Login to ECR
# ------------------------
echo "Logging into Amazon ECR..."
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# ------------------------
# Stop & Remove old container
# ------------------------
echo "Stopping and removing old container (if exists)..."
docker stop new-web-app || true
docker rm new-web-app || true

# ------------------------
# Clean unused Docker images
# ------------------------
echo "Cleaning unused Docker images..."
docker image prune -a -f

# ------------------------
# Pull latest Docker image
# ------------------------
echo "Pulling latest image..."
docker pull $IMAGE_URI

# ------------------------
# Run new container
# ------------------------
echo "Starting new container..."
docker run -d \
    --restart=always \
    --name new-web-app \
    -p 80:80 \
    $IMAGE_URI

echo "Deployment Completed Successfully!"


