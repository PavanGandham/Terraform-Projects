terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.75.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

data "aws_region" "current" {
  lifecycle {
      postcondition {
          condition = contains(["us-east-1","us-east-2"], self.name)
          error_message = "Region must be us-east-1 or us-east-2"
      }
  }
}

variable "cidr_block" {
    type = string
    description = "AWS VPC CIDR block"
    default = "10.0.0.0/16"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags {
      Name = "main-VPC"
  }
  lifecycle {
    precondition {
        condition = cidrnetmask(var.cidr_block) == "255.255.0.0"
        error_message = "Expecting a /16 for this VPC!"
    }
    postcondition {
        condition = join("", slice(split("", self.owner_id), 8, 12)) == "8704"
        error_message = "You Deployed Into the Wrong Account"
    }
  }
}

output "owner_id" {
  value = join("", slice(split("", aws_vpc.main.owner_id), 8, 12))
}