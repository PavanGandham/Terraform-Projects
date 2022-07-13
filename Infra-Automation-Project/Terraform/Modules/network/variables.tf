variable "vpc_cidr" {
    validation {
        condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}($|/(16))$", var.pod_cidr))
        error_message = "Vpc_cidr value must be greater than 172.0.0.0/16."
    }
}

variable "vpc_name" {}

variable "Igw_name" {}

variable "public_subnets" {}

variable "private_subnets" {}

variable "Main_Routing_Table" {}

variable "Private_Routing_Table" {}

variable "azs" {}

variable "Environment" {}
