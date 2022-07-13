resource "aws_route_table" "public-route-table" {
    vpc_id = "${aws_vpc.eks-dev-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks-igw.id
        tags = {
            Name = var.public-route-table
        }
    }
}
resource "aws_route_table_association" "public-route-associations" {
    count =  length(var.public-subnets)
    subnet_id = element(aws_subnet.public-subnets.*.id,count.index)
    route_table_id = element(aws_route_table.public-route-table.id)
}