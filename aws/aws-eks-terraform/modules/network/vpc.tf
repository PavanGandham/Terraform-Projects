resource "aws_vpc" "eks-dev-vpc" {
	# checkov:skip=CKV2_AWS_12: ADD REASON
	# checkov:skip=CKV2_AWS_11: ADD REASON
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "${var.vpc_name}"
        Environment = "${var.environment}"
        Owner_ID = "${var.owner-id}"
    }
}