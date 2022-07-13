resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    
    tags = {
        Name = "${var.vpc_name}"
    Owner = "Pavan G"
    environment = "${var.environment}"
    }
    
#     lifecycle{
#     create_before_destroy = true
#     #   prevent_destroy = true
#     ignore_changes = [
#         tags,
#     ]
#   }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
    tags = {
        Name = "${var.IGW_name}"
    }
}