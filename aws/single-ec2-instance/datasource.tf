data "aws_vpc" "awsb28" {
    id = "var.vpc_id"
}

resource "aws_subnet" "Public-Subnet-4" {
    vpc_id = "data.aws_vpc.awsb28.id"
    availability_zone = "us-east-1c"
    cidr_block = "10.40.4.0/24"
    tags = {
      "Name" = "Public-Subnet-4"
    }
}

resource "aws_subnet" "Public-Subnet-5" {
    vpc_id = "data.aws_vpc.awsb28.id"
    availability_zone = "us-east-1e"
    cidr_block = "10.40.5.0/24"
    tags = {
        "Name" = "Public-Subnet-5"
    }
}

resource "aws_subnet" "Public-Subnet-6" {
    vpc_id = "data.aws_vpc.awsb28.id"
    availability_zone = "us-east-1f"
    cidr_block = "10.40.6.0/24"
    tags = {
        "Name" = "Public-Subnet-6"
    }
}