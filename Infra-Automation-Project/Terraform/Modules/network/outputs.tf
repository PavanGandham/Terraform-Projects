output "vpc_id" {
    value = "${aws_vpc.test_vpc.id}"
}
output "vpc_name" {
    value = "${aws_vpc.test_vpc.tags.Name}"
}
output "all_public_subnets" {
    value = "${aws_subnet.public_subnets.*.id}"
}
output "all_private_subnets" {
    value = "${aws_subnet.private_subnets.*.id}"
}
output "public_sg_id" {
    value = "${aws_security_group.Public_SG.id}"
}
output "private_sg_id" {
    value = "${aws_security_group.Private_SG.id}"
}
output "env" {
    value = "${var.Environment}"
}
output "az" {
    value = "${aws_subnet.public_subnets.*.availability_zone}"
}