#!/bin/bash

# -- apply or destroy
CMD=${1:-'apply'}

# -- check if running in a terminal
AUTO_APPROVE=""
if [ -t 0 ]; then
  AUTO_APPROVE="-auto-approve"
fi

# -- run terrafrom from terrafrom folder
cd terraform

# -- execute terraform configuration
terraform $CMD $AUTO_APPROVE -var-file=env/dev.tfvars
