# ROUTING #
/*
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(local.common_tags, {
    Name = var.routenamebalancer
  })
  route {
    cidr_block = local.cidr_block_routes
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta-subnets" {
  count          = var.vpc_subnet_count
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rtb.id
}*/