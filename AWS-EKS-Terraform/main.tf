module "network" {
    source = "./modules/network"
    region = var.region
    azs = var.azs
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    public-subnets = var.public-subnets
    igw_name = var.igw_name
    sg_name = var.sg_name
    public-route-table = var.public-route-table
    environment = var.environment
    owner-id = var.owner-id
}
module "iam" {
    source = "./modules/iam"
    iam-role-name = var.iam-role-name
    workernodes-iam-role-name = var.workernodes-iam-role-name
    environment = var.environment
}
module "eks" {
    source = "./modules/eks"
    eks-cluster-name = var.eks-cluster-name
    eks-role-arn = module.iam.eks-role-arn
    vpc-subnet-ids = module.network.vpc-subnet-ids
    aws-iam-role = module.iam.eks-iam-role
    workernodes-iam-role-name = module.iam.worker-iam-role
    role-attachment-nodepolicy = module.iam.iam-policy-attachment
}