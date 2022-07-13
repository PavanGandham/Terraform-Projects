output "eks-role-arn" {
    value = "${aws_iam_role.eks-iam-role.arn}"
}
output "worker-node-role-arn" {
    value = "${aws_iam_role.eks-worker-node-role.arn}"
}
output "iam-policy-attachments" {
    value = "${aws_iam_role_policy_attachment.EKS-worker-node-policy-attach.*.policy_arn}"
}
output "eks-iam-role" {
    value = aws_iam_role.eks-iam-role.name
}
output "worker-iam-role" {
    value = aws_iam_role.eks-worker-node-role.name
}