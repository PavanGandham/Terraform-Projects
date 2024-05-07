variable "iam-role-name" {
    description = "AWS EKS IAM Role name"
    default = "terraform-eks-iam-role"
    type = string
}
variable "environment" {
    description = "AWS Deployment Environment"
    default = "Dev"
    type = string
}
variable "workernodes-iam-role-name" {
    description = "AWS EKS Worker nodes IAM role name"
    type = string
}