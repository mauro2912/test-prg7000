resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc-challenge1.id
}

resource "aws_security_group" "sg-private-challenge1" {
  vpc_id      = aws_vpc.vpc-challenge1.id
  description = "Private subnet security group"

  ingress {
    from_port       = -1
    to_port         = -1
    protocol        = "icmp"
    security_groups = [aws_security_group.sg-public-challenge1.id]
    description     = "Enable ping from public sg"
  }
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.sg-public-challenge1.id]
    description     = "Ssh access to private subnet ec2 instances"
  }
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internet access throw nat gateway"
  }

  tags = {
    Name = "Private segurity group challenge1"
  }
}

resource "aws_security_group" "sg-public-challenge1" {
  name        = "sg1-public-challenge1"
  description = "Security group internet access challenge1"
  vpc_id      = aws_vpc.vpc-challenge1.id

  tags = {
    Name = "External sg challenge1"
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internet access throw internet gateway"
  }
}

resource "aws_security_group_rule" "ingress-rules-challenge1" {
  count = length(var.sg-public-ingress-rules-challenge1)

  type        = "ingress"
  from_port   = var.sg-public-ingress-rules-challenge1[count.index].from_port
  to_port     = var.sg-public-ingress-rules-challenge1[count.index].to_port
  protocol    = var.sg-public-ingress-rules-challenge1[count.index].protocol
  cidr_blocks = [var.sg-public-ingress-rules-challenge1[count.index].cidr_block]
  description = var.sg-public-ingress-rules-challenge1[count.index].description

  security_group_id = aws_security_group.sg-public-challenge1.id
}