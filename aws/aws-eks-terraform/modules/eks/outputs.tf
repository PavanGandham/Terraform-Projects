output "eks-cluster-endpoint" {
    value = aws_eks_cluster.eks-cluster.endpoint
}
output "eks-cluster-status" {
    value = aws_eks_cluster.eks-cluster.status
}
output "eks-node-group-resources" {
    value =  aws_eks_node_group.worker-node-group.resources
}