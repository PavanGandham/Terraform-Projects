
resource "aws_route_table" "public_routing" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route = [ {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test_igw.id}"
  } ]
  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table" "private_routing" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  tags = {
    Name = "${var.Private_Routing_Table}"
  }
}

resource "aws_route_table_association" "public_subnets_associate" {
  count = "${length(var.public_subnets)}"
  subnet_id = "${element(aws_subnet.public_subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.public_routing.id}"
}

resource "aws_route_table_association" "private_subnet_associate" {
  count = "${length(var.private_subnets)}"
  subnet_id = "${element(aws_subnet.private_subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.private_routing.id}"
}