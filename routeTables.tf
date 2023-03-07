resource "aws_route_table" "private-rt-challenge1" {
  count      = length(var.private-CIDR-subnets-challenge1)
  vpc_id     = aws_vpc.vpc-challenge1.id
  depends_on = [aws_nat_gateway.nat-gateway-challenge1]

  route {
    cidr_block = "0.0.0.0/0"
    #nat_gateway_id = aws_nat_gateway.nat-gateway-challenge1[0].id
  }

  tags = {
    Name = "private-rt-${count.index}-challenge1"
  }
}

resource "aws_route_table" "public-rt-challenge1" {
  count  = length(var.public-CIDR-subnets-challenge1)
  vpc_id = aws_vpc.vpc-challenge1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig-challenge1.id
  }

  tags = {
    Name = "public-rt-${count.index}-challenge1"
  }
}

resource "aws_route_table_association" "private-rta-challenge1" {
  count          = length(var.public-CIDR-subnets-challenge1)
  subnet_id      = aws_subnet.private-subnet-challenge1[count.index].id
  route_table_id = aws_route_table.private-rt-challenge1[count.index].id
}

resource "aws_route_table_association" "public-rta-challenge1" {
  count          = length(var.public-CIDR-subnets-challenge1)
  subnet_id      = aws_subnet.public-subnet-challenge1[count.index].id
  route_table_id = aws_route_table.public-rt-challenge1[count.index].id
}
