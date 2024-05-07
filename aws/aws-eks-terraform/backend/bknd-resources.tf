terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
data "aws_canonical_user_id" "current" {}


# S3 Bucket for remote state file
resource "aws_s3_bucket" "remote-state" {
  # checkov:skip=CKV_AWS_144: ADD REASON
  # checkov:skip=CKV_AWS_145: ADD REASON
  # checkov:skip=CKV_AWS_18: ADD REASON
  # checkov:skip=CKV2_AWS_6: ADD REASON
  bucket        = var.lock-bucket-name
  force_destroy = true
  # lifecycle {
  #     prevent_destroy = true
  # }
  tags = {
    Name        = "${var.lock-bucket-name}"
    environment = "${var.environment}"
  }
}

resource "aws_s3_bucket_versioning" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "remote-state" {
  bucket = aws_s3_bucket.remote-state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id
  acl    = "private"
}

# DynamoDB state locking for S3 bucket
resource "aws_dynamodb_table" "terraform-state-lock" {
  # checkov:skip=CKV_AWS_119: ADD REASON
  name         = var.dynamodb-lock-table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "${var.dynamodb-lock-table}"
  }
  point_in_time_recovery {
    enabled = true
  }
}