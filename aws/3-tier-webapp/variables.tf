variable "region" {
  description = "AWS region"
}
variable "azs" {
  description = "AWS Availability Zones"
}
variable "vpc_cidr" {
  description = "AWS VPC CIDR"
}
variable "vpc_name" {
  description = "AWS VPC Name"
}
variable "public_subnets" {
  description = "VPC Public Subnets"
}
variable "private_app_subnets" {
  description = "Private app Subnets"
}
variable "private_db_subnets" {
  description = "Private db Subnets"
}
variable "igw_name" {
  description = "IGW NAME"
}
variable "public_route_table" {
  description = "Public Route Table name"
}
variable "private_route_table" {
  description = "Private Route Table name"
}
variable "environment" {
  description = "AWS 3-tier web app deploy Environment name"
}
variable "sg_name" {
  description = "SG name"
}
variable "instance_type" {
  description = "EC2 instance type"
}
variable "ami_id" {
  description = "EC2 Instance AMI ID"
}
variable "key_name" {
  description = "EC2 instance key-pair"
}
variable "allocated_storage" {
  description = "DB instance allocated storage"
}
variable "engine_type" {
  description = "RDS DB engine Type"
}
variable "engine_version" {
  description = "RDS DB engine version"
}
variable "instance_class" {
  description = "RDS DB instance class"
}
variable "alb-name" {
  description = "ALB Name"
}
variable "db-subnet-group-name" {
  description = "RDS DB subnet group name"
}
variable "db_name" {
  description = "RDS DB name"
}
variable "owner-id" {
  description = "AWS ACcount Owner ID"
}


