variable "region" {
  type = string
  description = "The AWS region"
  default = "us-east-1"
}
variable "azs" {
  description = "Availability Zones"
  type = list(string)
}
variable "public_subnets" {
  description = "Public Subnet"
  type = list(string)
}
variable "private_app_subnets" {
  description = "Private App Subnets"
  type = list(string)
}
variable "private_db_subnets" {
  description = "Private DB Subnets"
  type = list(string)
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type = string
}
variable "vpc_name" {
  description = "VPC Name"
  type = string
}
variable "igw_name" {
  description = "Internet Gateway Name"
  type = string
}
variable "public_route_table" {
  description = "Public routing table"
}
variable "private_route_table" {
  description = "Private routing table"
}
variable "environment" {
  description = "Deployment Environment"
}
variable "sg_name" {
  description = "security group name"
}
variable "owner-id" {
  description = "AWS Account Owner ID"
}
