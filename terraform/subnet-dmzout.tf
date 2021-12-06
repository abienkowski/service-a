# -- --
# -- define dmz-out subnet details
resource "aws_subnet" "dmzout_zone_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.dmzout_subnet_zone_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.vpc_name}-dmzout-zone-1"
  }
}

# -- allocated IP for outbound traffic
resource "aws_eip" "eip_dmzout_zone_1" {
  vpc = true

  tags = {
    Name = "${var.vpc_name}-dmzout-zone-1"
  }
}

# -- assign NAT gateway to subnet
resource "aws_nat_gateway" "dmzout_gw_zone_1" {
  allocation_id = aws_eip.eip_dmzout_zone_1.id
  subnet_id = aws_subnet.dmzout_zone_1.id

  tags = {
    Name = "${var.vpc_name}-dmzout-gw-zone-1"
  }
}

# -- create default gateway for subnet
resource "aws_route_table" "dmzout_rt_zone_1" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dmzout_gw_zone_1.id
  }

  tags = {
    Name = "${var.vpc_name}-dmzout-rt-zone-1"
  }
}
