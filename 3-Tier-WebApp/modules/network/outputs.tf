output "vpcid" {
    value = "${aws_vpc.prod_vpc.id}"
}
output "vpcname" {
    value = "${aws_vpc.prod_vpc.tags.Name}"
}
output "all-public-subnets" {
    value = "${aws_subnet.public_subnets.*.id}"
}
output "all-private-app-subnets" {
    value = "${aws_subnet.private_app_subnets.*.id}"
}
output "all-private-db-subnets" {
    value = "${aws_subnet.private_db_subnets.*.id}"
}
output "availability-zones" {
    value = "${var.azs}"
}
output "ec2-sg-id" {
    value = "${aws_security_group.ec2-sg.id}"
}
output "alb-sg-id" {
    value = "${aws_security_group.alb-sg.id}"
}
output "rds-sg-id" {
    value = "${aws_security_group.rds-sg.id}"
}
output "eips" {
    value = "${aws_eip.eips.*.public_ip}"
}
output "igw-id" {
    value = "${aws_internet_gateway.webapp_igw.id}"
}
output "nat-gateways" {
    value = "${aws_nat_gateway.prod_nat_gws.*.id}"
}
output "public-route-tables" {
    value = "${aws_route_table.public-route-table.*.id}"
}
output "private-app-route-tables" {
    value = "${aws_route_table.private-app-route-table.*.id}"
}
output "private-db-route-tables" {
    value = "${aws_route_table.private-db-route-table.*.id}"
}
output "s3-bucket-id" {
    value = "${aws_s3_bucket.my-vpc-flowlog-bucket.id}"
}
output "flow-log-id" {
    value = "${aws_flow_log.vpc-flow-logs.id}"
}
