variable "environment" {
  description = "AWS deploy Environment"
  default     = "Prod"
}
variable "lock-bucket-name" {
  description = "Terraform remote backend state file bucket name"
  default     = "webapp-terraform-statelock-bucket-1"
}
variable "dynamodb-lock-table" {
  description = "Dynamo DB Lock Table Name"
  default     = "webapp-terraform-dynamodb-locks"
}


