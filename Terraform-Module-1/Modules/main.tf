provider "aws" {
  access_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
  region = "us-east-1"
}

module "test-vpc" {
  source = ""
  
}
module "ec2-instance" {
  source = ""
  
}
