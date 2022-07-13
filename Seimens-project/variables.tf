variable "aws_region" {
    type = string
}
variable "aws_account" {
    type = string
}
variable "api_image_url" {
    type = string
}
variable "app_image_url" {
    type = string
}
variable "vpc_lookup_tags " {
    type = map(string)
}
variable "fargate_subnet_lookup_tags" {
    type = map(string)
}
variable "alb_subnet_lookup_tags" {
    type = map(string)
}
variable "s3_buckets" {
  type = list(string)
}
variable "dynamodb_tables" {
    type = list(string)
}