terraform {
  backend "s3" {
    bucket = "terraform-state-prg7000"
    key = "terraform.tfstate"
    region = var.region
    dynamodb_table = "terraform-locks-prg7000"
  }
}