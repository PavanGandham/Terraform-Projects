resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.prod_vpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.webapp_igw.id}"
  }
  tags = {
      Name = "${var.public_route_table}"
  }
}
resource "aws_route_table" "private-app-route-table" {
  count = "${length(var.private_app_subnets)}"  
  vpc_id = "${aws_vpc.prod_vpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = "${element(aws_nat_gateway.prod_nat_gws.*.id, count.index)}"

  }
  tags = {
      Name = "${var.private_route_table}-app-${count.index+1}"
  }
}
resource "aws_route_table" "private-db-route-table" {
  count = "${length(var.private_db_subnets)}"
  vpc_id = "${aws_vpc.prod_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.prod_nat_gws.*.id, count.index)}"
  }
  tags = {
    Name = "${var.private_route_table}-db-${count.index+1}"
  }
}


# Public Subnets Route Table Association for Webapp servers
resource "aws_route_table_association" "public-route-associations" {
  count = "${length(var.public_subnets)}"  
  subnet_id = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}

# Private Subnets Route Table Association for App servers
resource "aws_route_table_association" "private-route-app-associations" {
  count = "${length(var.private_app_subnets)}"
  subnet_id = "${element(aws_subnet.private_app_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private-app-route-table.*.id, count.index)}"
}

#Private Subnets Route Table Association for DB servers

resource "aws_route_table_association" "private-route-db-associations" {
  count = "${length(var.private_db_subnets)}"
  subnet_id = "${element(aws_subnet.private_db_subnets.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private-db-route-table.*.id, count.index)}"
}

