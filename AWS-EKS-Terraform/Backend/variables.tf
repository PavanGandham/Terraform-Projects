variable "environment" {
  description = "AWS deploy Environment"
  default     = "Dev"
  type        = string
}
variable "lock-bucket-name" {
  description = "Terrafrom remote backend state file bucket name"
  default     = "terraform-eks-statelock-bucket"
  type        = string
}
variable "dynamodb-lock-table" {
  description = "DynamoDB Lock Table Name"
  default     = "eks-terraform-dynamodb-lock"
  type        = string
}


