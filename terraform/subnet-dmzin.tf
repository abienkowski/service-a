# -- --
# -- define dmz-in subnet details
resource "aws_subnet" "dmzin_zone_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.dmzin_subnet_zone_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.vpc_name}-dmzin-zone-1"
  }
}
# -- --
# -- routing table for this subnet
resource "aws_route_table" "dmzin_rt" {
  vpc_id  = aws_vpc.vpc.id

  route  {
    cidr_block   = "0.0.0.0/0"
    gateway_id   = aws_internet_gateway.igw_zone_1.id
  }

  tags = {
    Name = "${var.vpc_name}-dmzin-rt"
  }
}
# -- --
# assign the routing table to the subnet
resource "aws_route_table_association" "dmzin_rt_sub" {
  route_table_id = aws_route_table.dmzin_rt.id
  subnet_id      = aws_subnet.dmzin_zone_1.id
}
