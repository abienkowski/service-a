# -- --
# -- define dmz-out subnet details
resource "aws_subnet" "dmzout_zone_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.dmzout_subnet_zone_1
  availability_zone = var.availability_zone_1
}

# -- allocated IP for outbound traffic
resource "aws_eip" "eip_dmzout_zone_1" {
  vpc = true
}

# -- assign NAT gateway to subnet
resource "aws_nat_gateway" "dmzout_gw_zone_1" {
  allocation_id = aws_eip.eip_dmzout_zone_1.id
  subnet_id = aws_subnet.dmzout_zone_1.id
}

# -- create default gateway for subnet
resource "aws_route_table" "dmzout_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dmzout_gw_zone_1.id
  }
}
