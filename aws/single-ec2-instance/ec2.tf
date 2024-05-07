# data "aws_ami" "my_ami" {
#     most_recent = true
#     name_regex = "^pavan"
#     owners = [""]
# }

resource "aws_instance" "web-1" {
    ami = "var.imagename"
    #ami = "ami-0d857ff0f5fc4e03b"
    #ami = "${data.aws_ami.my_ami.id}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "key-1"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    tags = {
        Name = "WebServer-1"
        Env = "Test"
        Owner = "Pavan"
        CostCenter = "ABCD"
    }
    user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get insatll -y nginx jq stress
        sudo curl -sL https://get.docker.com | bash
        sudo sleep 10
        sudo docker run --rm -dit --name docker1 -p 8000:80 sreeharshav/rollingupdate:v5
        echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
    EOF
}

