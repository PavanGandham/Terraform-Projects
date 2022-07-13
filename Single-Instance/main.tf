provider "aws" {
  access_key = ""
  secret_key = ""
  region = ""
}

terraform {
  backend "s3" {
    bucket = "pavanterrformbucket"
    key = "myterraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Terraform-locks"
    encrypt = true
  }
}

terraform {
  required_version = "<= 0.14" #Forcing which version of Terraform needs to be used.
  required_providers {
    aws = {
      version = "<= 3.0.0" #Forcing which version of plugin needs to be used.
      source = "hashicrop/aws"
    }
  }
}




