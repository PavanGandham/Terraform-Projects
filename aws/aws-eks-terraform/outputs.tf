output "eks-workernode-resources" {
    value = module.eks.eks-node-group-resources
}
output "eks-cluster-endpoint" {
    value = module.eks.eks-cluster-endpoint
}
output "eks-cluster-status" {
    value = module.eks.eks-cluster-status
}