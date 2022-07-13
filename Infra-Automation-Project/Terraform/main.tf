provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

module "testenv_network" {
  source = "./Modules/network"
  vpc_cidr = "10.120.0.0/16"
  vpc_name = "Test-VPC"
  Igw_name = "Test-VPC-Igw"
  azs = ["us-east-1a","us-east-1b","us-east-1c"]
  public_subnets = ["10.120.1.0"]
  private_subnets = [""]
  
}