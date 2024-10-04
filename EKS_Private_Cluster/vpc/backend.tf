
terraform {
  backend "s3" {
    bucket = "bharaths-eu-terraform-remote-state"
    key = "vpc"
    dynamodb_table = "bharaths-eu-terraform-remote-state-locks"
    region = "eu-west-2"
  }
}