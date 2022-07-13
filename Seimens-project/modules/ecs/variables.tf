variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}
variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
}
variable "app_port" {
  default     = 3000
  type = number
}
variable "app_count" {
  default     = 3
  type = number
}
variable "api_image_url" {
    type = string
}
variable "app_image_url" {
    type = string
}
variable "ecs_task_execution_role_name" {
  default = "myEcsTaskExecutionRole"
}