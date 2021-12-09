#!/bin/bash

set -e

# -- NOTE: this script is to be executed inside Jenins pipeline
# -- it is expecting jenkins network to exist

echo "Building image ..."
docker build . -t nginx-service

echo "Running container  ..."
# -- make sure the container does not exist
set +e
STATS=$(docker container stats --no-stream nginx-service 2>1)
if [ $? -eq 0 ]; then
  docker rm -f nginx-service
fi
set -e
# -- spin up the instance on the same network as jenkins
docker run -d --name nginx-service --network jenkins nginx-service
# -- 60s delay after container start
sleep 60

echo "Verifying Service ..."
curl -o downloaded-index.html http://nginx-service
diff downloaded-index.html app/index.html

echo "Removing build artifacts ..."
# -- cleanup image and running container
docker rm -f nginx-service
docker rmi nginx-service
