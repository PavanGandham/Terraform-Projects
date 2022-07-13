variable "private-app-subnet-ids" {
  description = "AWS Prod VPC private app subnets"
  type = list(string)
}
variable "launch-template-id" {
  description = "AWS EC2 Launch Template ID"
}
variable "alb-tg-arn" {
  description = "ALB target group ARN"
}
