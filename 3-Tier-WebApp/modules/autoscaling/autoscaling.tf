# Create ASG

resource "aws_autoscaling_group" "ec2-asg" {
  name = "Launch-Temp-ASG"
  max_size = 2
  min_size = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  desired_capacity = 2
  vpc_zone_identifier = ["${var.private-app-subnet-ids[0]}","${var.private-app-subnet-ids[1]}"]
  launch_template {
    id = "${var.launch-template-id}"
    version = "$Latest"
  }
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

# Create a new ALB Target Group attachment

resource "aws_autoscaling_attachment" "tg_attachment" {
  autoscaling_group_name = "${aws_autoscaling_group.ec2-asg.id}"
  alb_target_group_arn = "${var.alb-tg-arn}"
}

