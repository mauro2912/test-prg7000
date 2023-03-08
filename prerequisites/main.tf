terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>4.57"
    }
  }
#  required_version = ">= 0.14.9"
#  backend "s3" {
#    bucket = "terraform-state-prg7000"
#    key = "terraform.tfstate"
#    region = "us-east-1" 
#    dynamodb_table = "terraform-locks-prg7000"
#  }
}