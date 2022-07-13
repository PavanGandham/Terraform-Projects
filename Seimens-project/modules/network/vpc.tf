resource "aws_vpc" "seimens_mo_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = var.vpc_lookup_tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.seimens_mo_vpc.id
}

