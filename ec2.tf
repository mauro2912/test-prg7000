resource "aws_instance" "public-ec2-instances-challenge1" {
  count         = length(var.public-CIDR-subnets-challenge1)
  ami           = var.ec2-ami-challenge1
  instance_type = var.ec2-type-challenge1
  subnet_id     = aws_subnet.public-subnet-challenge1[count.index].id
  # vpc_security_group_ids = [aws_security_group.sg-public-challenge1.id]
  security_groups = [aws_security_group.sg-public-challenge1.id]
  #key_name        = aws_key_pair.keypair-challenge1.key_name
  user_data = local.user-data
  #iam_instance_profile   = aws_iam_instance_profile.instance-profile-challenge1.name
  #ebs_optimized = true
  #monitoring    = true

  #root_block_device {
  #  encrypted = true
  #}

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "Public-EC2-${count.index}-challenge1"
  }
}

#resource "aws_instance" "private-ec2-instances-challenge1" {
#  count                = length(var.private-CIDR-subnets-challenge1)
#  ami                  = var.ec2-ami-challenge1
#  instance_type        = var.ec2-type-challenge1
#  subnet_id            = aws_subnet.private-subnet-challenge1[count.index].id
#  security_groups      = [aws_security_group.sg-private-challenge1.id]
#  key_name             = aws_key_pair.keypair-challenge1.key_name
#  user_data            = local.user-data
#  iam_instance_profile = aws_iam_instance_profile.instance-profile-challenge1.name
#  ebs_optimized        = true
#  monitoring           = true
#
#  root_block_device {
#    encrypted = true
#  }
#
#  metadata_options {
#    http_endpoint = "enabled"
#    http_tokens   = "required"
#  }
#
#  tags = {
#    Name = "Private-EC2-${count.index}-challenge1"
#  }
#}
#
