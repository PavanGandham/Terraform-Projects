# Creating VPC for 3-Tier Application.
resource "aws_vpc" "prod_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "${var.vpc_name}"
        Environment = "${var.environment}"
        Owner_ID = "${var.owner-id}"
    } 
}
#Creating a S3 bucket for storing flowlogs
resource "aws_s3_bucket" "my-vpc-flowlog-bucket" {
    bucket = "my-vpc-flowlog-bucket"
    force_destroy = true
}
# Creating a VPC flowlog
resource "aws_flow_log" "vpc-flow-logs" {
    log_destination = "${aws_s3_bucket.my-vpc-flowlog-bucket.arn}"
    log_destination_type = "s3"
    traffic_type = "ALL"
    vpc_id = "${aws_vpc.prod_vpc.id}"
}