# Deploy service with ansible

This project provides a Dockerfile for a costom image based on nginx.

## To build the image run

```
docker build . -t nginx-service
```

## Push the image to docker hub

```
docker login
docker push nginx-service
```

## To deploy the service

```
ansible-playbook -i inventory site.yml
```

## Jenkins Installed Plugins

- AnsiColor
- Pipeline: Step AWS
- Cloudbees AWS Credentails
