# -- --
# -- define dmz-in subnet details
resource "aws_subnet" "dmzin_zone_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.dmzin_subnet_zone_1
  availability_zone = var.availability_zone_1
}
