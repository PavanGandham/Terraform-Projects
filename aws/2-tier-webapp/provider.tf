terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        versversion = "~> 4.19.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
}

terraform {
  cloud {
    organization = ""

    workspaces {
        name = ""
    }
  }
}