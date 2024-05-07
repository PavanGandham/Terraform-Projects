variable "instance_type" {
  type = string
  description = "The instance type of EC2"
  default = "t2.micro"
}
variable "ami_id" {
  description = "AMI for EC2"
}
variable "key-name" {
  description = "EC2 instance Key name"
}
variable "ec2-sg-id" {
  description = "VPC EC2 SG ID"
}
