output "alb-id" {
    value = "${aws_lb.web-alb.id}"
}
output "alb-dns-name" {
    value = "${aws_lb.web-alb.dns_name}"
}
output "alb-tg-id" {
    value = "${aws_lb_target_group.alb-target-group.id}"
}
output "alb-listener-id" {
    value = "${aws_lb_listener.alb-listener.id}"
}
output "alb-arn" {
    value = "${aws_lb.web-alb.arn}"
}
output "alb-tg-arn" {
    value = "${aws_lb_target_group.alb-target-group.arn}"
}
