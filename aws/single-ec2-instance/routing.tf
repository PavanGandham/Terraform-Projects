resource "aws_route_table" "public-route" {
    vpc_id = "${aws_vpc.default.id}"
    route =  {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}

resource "aws_route_table_association" "public-route" {
    subnet_id = "${aws_subnet.subnet1-public.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

