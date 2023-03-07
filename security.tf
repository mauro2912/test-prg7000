resource "aws_kms_key" "kms-key-challenge1" {
  description              = ""
  customer_master_key_spec = var.key-spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation-enabled
  tags                     = local.tags
  deletion_window_in_days  = 30
}

resource "aws_kms_alias" "kms-alias-challenge1" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.kms-key-challenge1.key_id
}

resource "aws_iam_role" "ec2-role-challenge1" {
  name = "EC2-role-profile"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "ec2.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )
}

resource "aws_iam_role" "flow-logs-role" {
  name = "flows-logs-role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "vpc-flow-logs.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )  
}

resource "aws_iam_role_policy" "role-policy-flow-logs" {
  name = "role-policy-flow-logs"
  role = aws_iam_role.flow-logs-role.id 
  policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action":[
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvent",
            "logs:DescribeLogGroups",
            "logs:DescribeLogStreams"
          ],
          "Effect": "Allow",
          "Resource": "*"
          #"Resource": "${nombre de la variable}"
        }
      ]
    }
  ) 
}

resource "aws_iam_instance_profile" "instance-profile-challenge1" {
  name = "EC2-profile"
  role = aws_iam_role.ec2-role-challenge1.name
}