#!/bin/bash

set -ex

# -- apply or destroy
CMD=${1:-'apply'}

# -- check if running in a terminal
AUTO_APPROVE="-auto-approve"
if [ -t 0 ]; then
  AUTO_APPROVE=""
fi

# -- run terrafrom from terrafrom folder
cd terraform

# -- execute terraform configuration
terraform init
terraform $CMD $AUTO_APPROVE -var-file=env/jenkins.tfvars
