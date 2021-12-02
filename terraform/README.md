# Deploying a service on AWS with Terraform

This project implement VPC on AWS with network segregation.

All traffic is routed through outbound proxy.

## To deploy all resources use

```
~$ source .awscreds
~$ terraform apply -var-file=env/dev.tfvars
```


