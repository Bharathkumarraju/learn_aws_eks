
terraform {
  backend "s3" {
    bucket = "bharaths-test-terraform-remote-state"
    key = "vpc"
    dynamodb_table = "bharaths-test-terraform-remote-state-locks"
    region = "eu-west-2"
  }
}