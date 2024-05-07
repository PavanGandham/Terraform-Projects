variable "eks-cluster-name" {
    description = "AWS EKS Cluster Name"
    default = "aws-terraform-eks-cluster"
    type = string
}
variable "iam-role-name" {
    description = "AWS EKS IAM Role name"
    default = "terraform-eks-iam-role"
    type = string
}
variable "workernodes-iam-role-name" {
    description = "AWS EKS Worker nodes IAM role name"
    type = string
}
variable "environment" {
    description = "AWS Deployment Environment"
    default = "Dev"
    type = string
}
variable "region" {
    description = "AWS Region"
    default = "us-east-1"
    type = string
}
variable "azs" {
    description = "AWS Availability Zones"
    type = list(string)
}
variable "public-subnets" {
    description = "AWS EKS VPC Public Subnet Cidrs"
    type = list(string)
}
variable "vpc_cidr" {
    description = "VPC CIDR Block"
    type = string
}
variable "vpc_name" {
    description = "AWS VPC Name"
    type = string
}
variable "igw_name" {
    description = "AWS Internet gateway name"
    type =  string
}
variable "public-route-table" {
    description = "Public Route table name"
    type = string
}
variable "environment" {
    description = "Deployment Environment"
    type = string
    default = "Dev"
}
variable "sg_name" {
    description = "Security Group name"
    type = string
}
variable "owner-id" {
    description = "AWS Owner ID"
    type = string
}