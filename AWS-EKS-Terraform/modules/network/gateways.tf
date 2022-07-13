resource "aws_internet_gateway" "eks-igw" {
    vpc_id = aws_vpc.eks-dev-vpc.id
    tags = {
        Name = var.igw_name
        Environment = var.environment
    }
}