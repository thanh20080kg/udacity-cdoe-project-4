#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag project4-ml:v1.0.0 .

# Step 2:
# List docker images
docker image ls

# Step 3:
docker run -p 8000:80 project4-ml:v1.0.0
