# -- --
# -- defines variables for the deployment

variable "vpc_name" {}
variable "vpc_cidr" {}

# -- geographical region and availability zones
variable "region" {}
variable "availability_zone_1" {}

# -- --
# defines VPC networking and availability zones
# --
variable "dmzin_subnet_zone_1" {}
variable "dmzout_subnet_zone_1" {}
variable "admin_subnet_zone_1" {}
