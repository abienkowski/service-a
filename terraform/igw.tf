# -- --
# -- define Internet Gateway details
resource "aws_internet_gateway" "igw_zone_1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
