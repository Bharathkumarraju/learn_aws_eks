

terraform {
  backend "s3" {
    bucket = "bharaths-eu-terraform-remote-state"
    key = "eks"
    dynamodb_table = "bharaths-eu-terraform-remote-state-locks"
    region = "eu-west-2"
  }
}