resource "aws_subnet" "public-subnet-challenge1" {
  count             = length(var.public-CIDR-subnets-challenge1)
  vpc_id            = aws_vpc.vpc-challenge1.id
  availability_zone = var.availability-zone-challenge1[count.index]
  cidr_block        = var.public-CIDR-subnets-challenge1[count.index]

  #map_public_ip_on_launch = false

  tags = {
    Name = "public-subnet-${count.index}-challenge1"
  }
}

resource "aws_subnet" "private-subnet-challenge1" {
  count             = length(var.private-CIDR-subnets-challenge1)
  vpc_id            = aws_vpc.vpc-challenge1.id
  availability_zone = var.availability-zone-challenge1[count.index]
  cidr_block        = var.private-CIDR-subnets-challenge1[count.index]

  #map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-${count.index}-challenge1"
  }
}