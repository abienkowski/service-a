# -- --
#variable "access_key" {}
#variable "secret_key" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# -- --
# -- configure the AWS Cloud Provider access
provider "aws" {
  region     = var.region

  # -- --
  # -- access
#  access_key = var.access_key
#  secret_key = var.secret_key
}
