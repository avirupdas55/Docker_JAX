#!/usr/bin/env bash

# Default values
DOCKER_TAG="avirupdas55/jax:v2"
DOCKER_ID="avirupdas55"

# Check if user provided tag name as argument
if [ -n "$1" ]; then
    DOCKER_TAG="$DOCKER_ID/$1"
fi

# Check if user provided Docker Hub ID as argument
if [ -n "$2" ]; then
    DOCKER_ID="$2"
fi

echo "Building Docker image with tag: $DOCKER_TAG"

DOCKER_BUILDKIT=1 docker build --platform linux/amd64 -t $DOCKER_TAG .

# Check if the user is already logged in to Docker Hub
if ! docker info --format '{{.RegistryConfig.IndexConfigs}}' | grep -q "$DOCKER_ID"; then
    echo "Logging in to Docker Hub as $DOCKER_ID"
    docker login
fi

# Tag the Docker image
docker tag $DOCKER_TAG $DOCKER_ID/$DOCKER_TAG

# Push the Docker image to Docker Hub
docker push $DOCKER_ID/$DOCKER_TAG

echo "Docker image has been built and pushed to Docker Hub with tag: $DOCKER_TAG"