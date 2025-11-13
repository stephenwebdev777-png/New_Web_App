#!/bin/bash
set -e

# login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 390403865161.dkr.ecr.us-east-1.amazonaws.com

# stop and remove previous container if present
docker stop simpledeployapp || true
docker rm simpledeployapp || true

# pull latest image and run
docker pull 390403865161.dkr.ecr.us-east-1.amazonaws.com/simpledeployapp:latest
docker run -d --name simpledeployapp -p 80:80 390403865161.dkr.ecr.us-east-1.amazonaws.com/simpledeployapp:latest
