#!/bin/bash

docker build . -t nginx-service
docker run -d --name nginx-service -p 80 nginx-service
sleep 60
nc -vzw5 localhost 80
curl -o /tmp/index.html localhost
diff /tmp/index.html index.html
# -- cleanup build artifacts
docker rm -f nginx-service
docker rmi nginx-service
