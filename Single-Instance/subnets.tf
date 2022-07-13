resource "aws_subnet" "subnet1-public" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public-subnet1_cidr}"
  availability_zone = "us-east-1a"
  tags = {
      Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "subnet2-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-1b"
    tags = {
        Name = "${var.public_subnet2_name}"
    }

}

resource "aws_subnet" "subnet3_public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet3_cidr}"
    availability_zone = "us-east-1c"
    tags = {
        Name = "${var.public_subnet3_name}"
    }
}

