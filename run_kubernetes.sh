#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
docker_path=shironguyen/project4-ml:v1.0.0

# Step 2
# Run the Docker Hub container with kubernetes
r=$(
  kubectl get pod ml-api 2>/dev/null
  echo $?
)

if [ "_$r" == "_1" ]; then
  kubectl run ml-api \
    --image=$docker_path \
    --image-pull-policy="Always" \
    --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "regcred"}]}}'
fi

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-api 8000:80
