resource "aws_eip" "elastic-IP-challenge1" {
  #count      = length(var.availability-zone-challenge1)
  vpc        = true
  depends_on = [aws_internet_gateway.ig-challenge1]

  tags = {
    Name = "Elastic-IP-challenge1"
  }
}