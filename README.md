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
ansible-playbook -i inventory -l tag_Name_${var.vpc_name}-nginx site.yml
```

## Jenkins Installed Plugins

- AnsiColor
- Cloudbees AWS Credentails
- Pipeline: Step AWS
- SSH-Agent
