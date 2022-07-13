data "aws_availability_zones" "available_azs" {}

resource "aws_subnet" "alb_subnet" {
  count = length(var.az_count)
  vpc_id = aws_vpc.seimens_mo_vpc.id
  cidr_block = cidrsubnet(aws_vpc.seimens_mo_vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone = data.aws_availability_zones.available_azs.names[count.index]
  map_public_ip_on_launch = true
  tags = var.alb_subnet_lookup_tags
}

resource "aws_subnet" "fargate_subnet" {
  count = length(var.az_count)
  vpc_id = aws_vpc.seimens_mo_vpc.id
  cidr_block = cidrsubnet(aws_vpc.seimens_mo_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available_azs.names[count.index]
  tags = var.fargate_subnet_lookup_tags
}
