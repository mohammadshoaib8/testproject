#!/bin/bash

# Define variables
REMOTE_USER="your_username"
REMOTE_HOST="your_server_ip"
IMAGE_NAME="my-react-app"
IMAGE_TAG="latest"

# Build the Docker image (you can uncomment this if you want to ensure the image is built before deploying)
# ./build.sh

# Transfer the Docker image to the server
echo "Transferring Docker image to the server..."
docker save $IMAGE_NAME:$IMAGE_TAG | ssh $REMOTE_USER@$REMOTE_HOST "docker load"

# SSH into the server and run Docker commands
echo "Deploying Docker image on the server..."
ssh $REMOTE_USER@$REMOTE_HOST << EOF
  # Ensure Docker is installed (uncomment if needed)
  # sudo apt-get update
  # sudo apt-get install -y docker.io
  
  # Stop and remove the existing container (if any)
  docker stop $IMAGE_NAME || true
  docker rm $IMAGE_NAME || true

  # Run the new container
  docker run -d --name $IMAGE_NAME -p 80:80 $IMAGE_NAME:$IMAGE_TAG
EOF

echo "Deployment complete."
