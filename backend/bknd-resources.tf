
terraform {
  required_version = ">= 1.0.0 , < 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}


# S3 Bucket for remote state file 
resource "aws_s3_bucket" "remote-state" {
  bucket = "webapp-terraform-statelock-bucket-1"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true
  # lifecycle {
  #   prevent_destroy = true
  # }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "${var.lock-bucket-name}"
    environment = "${var.environment}"
  }
}

# DynamoDB state locking for S3 bucket
resource "aws_dynamodb_table" "terraform-locks-db" {
  name         = "webapp-terraform-dynamodb-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "${var.dynamodb-lock-table}"
  }
}