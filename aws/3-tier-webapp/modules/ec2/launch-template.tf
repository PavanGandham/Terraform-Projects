resource "aws_launch_template" "ec2-web-server-template" {
  name = "WebServer-EC2"
  block_device_mappings {
      device_name = "/dev/xvda"
      ebs {
          volume_size = 8
      }
  }
  instance_type = "${var.instance_type}"
  image_id = "${var.ami_id}"
  key_name = "${var.key-name}"
  user_data = filebase64("user_data.sh")
  network_interfaces {
      associate_public_ip_address = false
      security_groups = ["${var.ec2-sg-id}"]
  }
}

