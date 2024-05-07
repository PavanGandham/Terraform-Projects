variable "alb-name" {
  description = "ALB Name"
  type = string
}

variable "public-subnet-ids" {
  description = "ALL VPC public Subnets"
  type = list(string)
}
variable "alb-sg-id" {
  description = "ALB SG from VPC"
}
variable "vpc-id" {
  description = "AWS Prod VPC ID"
}
