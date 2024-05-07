resource "aws_iam_role" "eks-iam-role" {
    name = "${var.iam-role-name}"
    path = "/"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]        
    }
    EOF
    tags = {
        Name = "${var.iam-role-name}"
        env = "${var.environment}"
    }
}

# AWS EKS IAM Role for Worker Nodes
resource "aws_iam_role" "eks-worker-node-role" {
    name = "${var.workernodes-iam-role-name}"
    assume_role_policy = jsonencode({
        Version: "2012-10-17"
        Statement: [
            {
                Action: "sts:AssumeRole"
                Effect: "Allow"
                Principal: {
                    Service: "ec2.amazonaws.com"
                }
            }
        ]
    })
    tags = {
        Name = "${var.workernodes-iam-role-name}"
        env = "${var.environment}"
    }
}
