resource "aws_security_group" "eks-sg" {
	# checkov:skip=CKV2_AWS_5: ADD REASON
    name = var.sg_name
    description = "Allows all traffic to EKS cluster"
    vpc_id = aws_vpc.eks-dev-vpc.id
    ingress {
        description = "Allow all traffic from anywhere"
        from_port = 0
        to_port = 0
        protocol = -1
    }
    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = -1
    }
    tags = {
        "Name" = "${var.sg_name}"
        Environment = "${var.environment}"
    }
}