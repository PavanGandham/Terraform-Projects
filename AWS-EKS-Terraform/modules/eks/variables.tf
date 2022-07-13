variable "eks-cluster-name" {
    description = "AWS EKS Cluster Name"
    default = "aws-terraform-eks-cluster"
    type = string
}
variable "eks-role-arn" {
    description = "AWS EKS IAM role ARN"
    type = string
}
variable "vpc-subnet-ids" {
    description = "AWS VPC network subnet IDs 1 and 2"
    type = "list(string)"
}
variable "aws-iam-role" {
    description = "AWS EKS IAM Role"
    type = string
}
variable "workernodes-iam-role-name" {
    description = "AWS EKS Worker Nodes IAM role name"
    type = string
}
variable "role-attachment-nodepolicy" {
    description = "AWS IAM Policy attachment for AmazonEKSWorkerNodePolicy"
    type = list
}
