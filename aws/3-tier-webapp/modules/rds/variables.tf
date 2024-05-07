variable "allocated_storage" {
  description = "rds allocated instance storage"
}

variable "engine_type" {
  description = "RDS DB engine type"
}

variable "engine_version" {
  description = "RDS DB engine version"
}

variable "instance_class" {
  description = "RDS instance class"
}
variable "private-db-subnet-ids" {
  description = "Private DB subnets IDs"
  type = list(string)
}
variable "db-subnet-group-name" {
  description = "RDS DB Subnet group name"
}
variable "name" {
  description = "RDS DB Name"
}
variable "rds-sg-id" {
  description = "RDS Security Group ID"
}
variable "db-username" {
  description = "RDS DB Username"
  sensitive = true
}
variable "db-password" {
  description = "RDS DB Password"
  sensitive = true
}

