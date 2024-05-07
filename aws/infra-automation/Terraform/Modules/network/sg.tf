resource "aws_security_group" "Public_SG" {
  name = "Public_SG"
  description = "Allow only Specific inbound traffic"
  vpc_id = "${aws_vpc.test_vpc.id}"

  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow TLS traffic"
    from_port = 443
    protocol = "tcp"
    self = false
    to_port = 443
  },
  {
    cidr_blocks = [ "103.49.53.89/32" ]
    description = "Allow SSH from My-IP"
    from_port = 22
    protocol = "tcp"
    self = false
    to_port = 22
  },
  {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow HTTP traffic"
    from_port = 80
    protocol = "tcp"
    self = false
    to_port = 80
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow All outbound tarffic"
    from_port = 0
    protocol = "-1"
    self = false
    to_port = 0
  } ]
}

resource "aws_security_group" "Private_SG" {
  name = "Private_SG"
  description = "Allow only SSH from Bastion Host"
  vpc_id = "${aws_vpc.test_vpc.id}"

  ingress = [ {
    cidr_blocks = [ "${aws_ec2}" ]
    description = "Allow SSH from Bastion Host"
    from_port = 22
    protocol = "tcp"
    self = false
    to_port = 22
  } ]
}