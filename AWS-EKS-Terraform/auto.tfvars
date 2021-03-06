region = "us-east-1"
azs = ["us-east-1a","us-east-1b"]
vpc_cidr = "10.77.0.0/16"
vpc_name = "EKS-Dev-VPC"
public-subnets = ["10.77.1.0/24","10.77.2.0/24"]
igw_name = "EKS-Dev-IGW"
sg_name = "SG-For-EKS"
public-route-table = "EKS-Dev-Public-RT"
environment = "Dev"
owner-id = "Pavan-Gandham"
iam-role-name = "EKS-Dev-IAM-role"
workernodes-iam-role-name = "EKS-Dev-Worker-Nodes-IAM-role"
eks-cluster-name = "EKS-Dev-Cluster"
