data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bharaths-eu-terraform-remote-state"
    key    = "vpc"
    region = "eu-west-2"
  }
}