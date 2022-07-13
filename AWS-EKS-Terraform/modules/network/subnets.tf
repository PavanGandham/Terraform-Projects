resource "aws_subnet" "public-subnets" {
    count = "${length(var.public-subnets)}"
    vpc_id = "${aws_vpc.eks-dev-vpc.id}"
    cidr_block = "${element(var.public-subnets, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"
    tags = {
        Name = "${var.vpc_name}-Public-Subnet-${count.index+1}"
        environment = "${var.environment}"
    }
}
