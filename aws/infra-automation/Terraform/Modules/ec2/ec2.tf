resource "aws_instance" "Web-Servers" {
  count = var.machine_count
  ami = var.image_name
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = "${element(var.public_subnets,count.index)}"
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  iam_instance_profile = var.iam_instance_profile
  tags = {
    Name = "${var.vpc_name}-Web-Server-${count.index+1}"
    Env = var.environment
    Owner = "Pavan Gandham"
    CostCenter = "Organization"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update -y
      sudo apt-get install -y nginx
      sudo systemctl start nginx
      echo <h1>Deployed via Terraform in ${var.vpc_name}-Web-Server-${count.index} with Hostname : $(cat /etc/hostname) </h1> | sudo tee /var/www/html/index.html
  EOF
}

resource "aws_instance" "Databases" {
  count = var.machine_count
  ami = var.image_name
  instance_type = var.instance_type
  key_name = var.key_name
  iam_instance_profile = var.iam_instance_profile
  subnet_id = ${element(var.private_subnets,count.index)}
  vpc_security_vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = false
  tags = {
    Name = "${var.vpc_name}-DB-server-${count.index+1}"
    Env = var.environment
    Owner = "Pavan Gandham"
    CostCenter = "Organization"
  }
  user_data = <<-EOF
      #!/bin/bash
      sudo apt-get update -y
      sudo apt-get install mysql-service-8.0 -y
      
}