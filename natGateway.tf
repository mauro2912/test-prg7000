resource "aws_nat_gateway" "nat-gateway-challenge1" {
  depends_on = [aws_internet_gateway.ig-challenge1]
  #count         = length(var.public-CIDR-subnets-challenge1)
  allocation_id = aws_eip.elastic-IP-challenge1.id
  subnet_id     = aws_subnet.public-subnet-challenge1[0].id

  tags = {
    Name = "NAT-gateway-challenge1"
  }
}