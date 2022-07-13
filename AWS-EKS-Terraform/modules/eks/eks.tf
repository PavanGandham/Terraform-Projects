resource "aws_eks_cluster" "eks-cluster" {
	# checkov:skip=CKV_AWS_37: ADD REASON
    count = "${length(var.vpc-subnet-ids)}"
    name = "${var.eks-cluster-name}"
    role_arn = "${var.eks-role-arn}"
    vpc_config {
        endpoint_public_access = false
        subnet_ids = ["${element(var.vpc-subnet-ids,count.index)}"]
    }
    depends_on = [
        "${var.aws-iam-role}",
    ]
    encryption_config {
    resources = ["secrets"]
    }
}
resource "aws_eks_node_group" "worker-node-group" {
    count = "${length(var.vpc-subnet-ids)}"
    cluster_name = "${aws_eks_cluster.eks-cluster.name}"
    node_group_name = "${var.workernodes-iam-role-name}"
    node_role_arn = "${var.node-role-arn}"
    subnet_ids = ["${element(var.vpc-subnet-ids,count.index)}"]
    instance_types = [ "t3.xlarge" ]
    scaling_config {
        desired_size = 1
        max_size = 1
        min_size = 1
    }
    depends_on = [
        "${var.role-attachment-nodepolicy}"
    ]
}


