#!/bin/bash
set -e

REGION="us-east-1"
ACCOUNT_ID="390403865161"
REPOSITORY_NAME="new-web-app-repo"
IMAGE_URI="$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:latest"

echo "Logging into ECR..."
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Pulling latest image..."
docker pull $IMAGE_URI

echo "Starting container..."
docker run -d \
  --restart=always \
  --name new-web-app \
  -p 80:80 \
  $IMAGE_URI



