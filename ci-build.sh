#!/bin/bash

# -- NOTE: this script is to be executed inside Jenins pipeline
# -- it is expecting jenkins network to exist

docker build . -t nginx-service
docker run -d --name nginx-service --network jenkins nginx-service
sleep 60
curl -o /tmp/index.html http://nginx-service
diff /tmp/index.html app/index.html
# -- cleanup build artifacts
docker rm -f nginx-service
docker rmi nginx-service
