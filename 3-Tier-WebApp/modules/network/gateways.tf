# Prod VPC internet gateway for Public internet
resource "aws_internet_gateway" "webapp_igw" {
  vpc_id = "${aws_vpc.prod_vpc.id}"
  tags = {
      Name = "${var.igw_name}"
  }
}
# Prod VPC NAT gateway for Private internet
resource "aws_nat_gateway" "prod_nat_gws" {
  count = "${length(var.public_subnets)}"
  allocation_id = "${element(aws_eip.eips.*.id, count.index)}"
  subnet_id = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  depends_on = [aws_internet_gateway.webapp_igw]
  tags = {
    Name = "${var.vpc_name}-NAT-gateway-${count.index+1}"
  }  
}

