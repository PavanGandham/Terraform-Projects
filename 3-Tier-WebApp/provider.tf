terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
# # State file remote backend (S3 Bucket)
# terraform {
#   backend "s3" {
#     bucket         = "webapp-terraform-statelock-bucket-1"
#     key            = "statefiles/webappterraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "webapp-terraform-dynamodb-locks"
#     encrypt        = true
#   }
# }
# State file Remote Backend (Terraform Cloud)
terraform {
    backend "remote" {
        organization = "pavanterraform"
        workspaces {
            name = "AWS-3-Tier-Application"
            }
        }
    }
