resource "aws_internet_gateway" "ig-challenge1" {
  vpc_id = aws_vpc.vpc-challenge1.id

  tags = {
    Name = "ig-challenge1"
  }
}