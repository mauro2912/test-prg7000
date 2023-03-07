resource "aws_flow_log" "flow-logs-vpc-challenge1" {
  #  log_group_name = aws_cloudwatch_log_group.logsGroup-challenge1
  #iam_role_arn = aws_iam_role.flow-logs-role.id
  vpc_id = aws_vpc.vpc-challenge1.id
}

resource "aws_vpc" "vpc-challenge1" {
  cidr_block = var.default-CIDR-challenge1

  tags = {
    Name = "vpc-challenge1"
  }
}
