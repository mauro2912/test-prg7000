data "aws_iam_policy_document" "ec2-role-policy-document" {
  statement {
    sid    = ""
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
  }
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ssm-key-challenge1" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["kms*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }

  statement {
    sid       = "Allow access for key administrators"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["key*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:user/${local.admin_username}",
        "arn:aws:iam::${local.account_id}:role/aws-service-role/support.amazonaws.com/AWSServiceRoleForSupport",
        "arn:aws:iam::${local.account_id}:role/aws-service-role/trustedadvisor.amazonaws.com/AWSServiceRoleForTrustedAdvisor"
      ]
    }
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["key*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:user/${local.admin_username}",
        "arn:aws:iam::${local.account_id}:role/aws-service-role/support.amazonaws.com/AWSServiceRoleForSupport",
        "arn:aws:iam::${local.account_id}:role/aws-service-role/trustedadvisor.amazonaws.com/AWSServiceRoleForTrustedAdvisor"
      ]
    }
  }
}