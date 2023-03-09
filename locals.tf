locals {
  tags = {
    Workload    = var.workload
    Environment = var.environment
    Owner       = var.owner
  }
}

locals {
  admin_username = "andres.gonzalez"
  account_id     = data.aws_caller_identity.current.account_id
}

locals {
  user-data = templatefile("init.sh", {
    ssm_cloudwatch_config = aws_ssm_parameter.cw-agent.name
  })
}

locals {
  role-policy-arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
}