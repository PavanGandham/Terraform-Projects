terraform {
    required_version = ">=1.0.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.64.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
}

terraform {
    backend "s3" {
        bucket = "terraform-eks-statelock-bucket"
        key = "statefiles/Dev-statefile/dev-env-terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "eks-terraform-dynamodb-lock"
        encrypt = true
    }
}