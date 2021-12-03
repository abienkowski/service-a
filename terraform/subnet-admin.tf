# -- --
# -- define admin subnet details
resource "aws_subnet" "admin_zone_1" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone_1
  cidr_block = var.admin_subnet_zone_1
}
