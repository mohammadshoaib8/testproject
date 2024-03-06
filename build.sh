#!/bin/bash

# Define the Docker image name
IMAGE_NAME="my-react-app"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image '$IMAGE_NAME' built successfully."
else
  echo "Error: Docker image build failed."
  exit 1
fi
