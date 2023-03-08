terraform {
  backend "s3" {
    bucket = "${aws_s3_bucket.terraform-state}"
    key = "terraform.tfstate"
    region = var.region
    dynamodb_table = "terraform-locks-prg7000"
  }
}