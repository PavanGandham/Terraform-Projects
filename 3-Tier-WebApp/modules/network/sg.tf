# Create ALB Security Group
resource "aws_security_group" "alb-sg" {
    name = "${var.sg_name}-ALB"
    description = "Allow web inbound traffic"
    vpc_id = "${aws_vpc.prod_vpc.id}"
    ingress {
        description = "all traffic from VPC"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow web outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.sg_name}-ALB"
    }
}
# Create EC2 Security Group 
resource "aws_security_group" "ec2-sg" {
    name = "${var.sg_name}-EC2"
    description = "Allows ALB to access the EC2 instances"
    vpc_id = "${aws_vpc.prod_vpc.id}"
    ingress {
        description = "TLS from ALB"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = ["${aws_security_group.alb-sg.id}"]
    }
    ingress {
        description = "TLS from ALB"
        from_port = 8443
        to_port = 8443
        protocol = "tcp"
        security_groups = ["${aws_security_group.alb-sg.id}"]
    }
    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.sg_name}-EC2"
    }
}
# Create Database Security Group
resource "aws_security_group" "rds-sg" {
    name = "${var.sg_name}-RDS"
    description = "Allows application to access the RDS instances"
    vpc_id = "${aws_vpc.prod_vpc.id}"
    ingress {
        description = "EC2 to MYSQL"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.ec2-sg.id}"]
    }
    egress {
        description = "Allow all outbound tarffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "${var.sg_name}-RDS"
    }
}