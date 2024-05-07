resource "aws_instance" "web-2" {
    ami = "var.imagename"
    availability_zone = "us-east-1b"
    instance_type = "t2.micro"
    key_name = "key-1"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    tags = {
        Name = "Imported-Server"
        Env = "Test"
        Owner = "Pavan"
        CostCenter = "ABCD"
    }
}
