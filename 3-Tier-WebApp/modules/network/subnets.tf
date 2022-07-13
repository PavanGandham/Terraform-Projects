# Creating a public subnets for Web Servers
resource "aws_subnet" "public_subnets" {
  count = "${length(var.public_subnets)}"  
  vpc_id = "${aws_vpc.prod_vpc.id}"
  cidr_block = "${element(var.public_subnets,count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  tags = {
      Name = "${var.vpc_name}-Public_Subnet-${count.index+1}"
      environment = "${var.environment}"
  }
}

# Creating Private Subnets for App 
resource "aws_subnet" "private_app_subnets" {
  count = "${length(var.private_app_subnets)}"
  vpc_id  = "${aws_vpc.prod_vpc.id}"
  cidr_block = "${element(var.private_app_subnets, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  tags = {
      Name = "${var.vpc_name}-Private-App-Subnet-${count.index+1}"
      environment = "${var.environment}"
  }
}

# Creating Private Subnets for DB

resource "aws_subnet" "private_db_subnets" {
  count = "${length(var.private_db_subnets)}"
  vpc_id = "${aws_vpc.prod_vpc.id}"
  cidr_block = "${element(var.private_db_subnets, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  tags = {
    Name = "${var.vpc_name}-Private-DB-Subnet-${count.index+1}"
    environment = "${var.environment}"
  }
}

