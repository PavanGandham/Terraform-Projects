resource "aws_subnet" "public_subnets" {
  count = "${length(var.public_subnets)}"  
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "${element(var.public_subnets,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "${var.vpc_name}-Public_Subnet_${count.index+1}"
    Environment = "${var.Environment}"
  }

}

resource "aws_subnet" "private_subnets" {
  count = "${length(var.private_subnets)}"  
  vpc_id = "${var.test_vpc.id}"
  cidr_block = "${element(var.private_subnets,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name  = "${var.vpc_name}-Private_Subnet_${count.index+1}"
    Environment = "${var.Environment}"
  }
}

