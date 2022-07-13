# Create a LoadBalancer

resource "aws_lb" "web-alb" {
  name = "${var.alb-name}"
  internal = false
  load_balancer_type = "application"
  security_groups = ["${var.alb-sg-id}"]
  subnets = ["${var.public-subnet-ids[0]}","${var.public-subnet-ids[1]}"]
}
resource "aws_lb_target_group" "alb-target-group" {
  name = "alb-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = "${var.vpc-id}"
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = "${aws_lb.web-alb.arn}"
  port = 80
  protocol = "HTTP"
  default_action {
      type = "forward"
      target_group_arn = "${aws_lb_target_group.alb-target-group.arn}"
  }
}

