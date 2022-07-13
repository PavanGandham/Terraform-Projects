resource "aws_route_table" "default_route_table" {
  vpc_id = aws_vpc.seimens_mo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "alb_subnet_associate" {
  count = length(var.alb_subnet)
  subnet_id = element(aws_subnet.alb_subnet.*.id,count.index)
  route_table_id = aws_route_table.default_route_table.id
}
resource "aws_route_table_association" "fargate_subnet_associate" {
  count = length(var.fargate_subnet)
  subnet_id = element(aws_subnet.fargate_subnet.*.id,count.index)
  route_table_id = aws_route_table.default_route_table.id
}