# AWS Network Module
module "prod_network" {
  source              = "./modules/network"
  region              = var.region
  azs                 = var.azs
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
  igw_name            = var.igw_name
  public_route_table  = var.public_route_table
  private_route_table = var.private_route_table
  environment         = var.environment
  sg_name             = var.sg_name
  owner-id            = var.owner-id
}

# AWS EC2 Module
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key-name      = var.key_name
  ec2-sg-id     = module.prod_network.ec2-sg-id
}

# AWS ALB Module
module "alb" {
  source            = "./modules/alb"
  alb-name          = var.alb-name
  vpc-id            = module.prod_network.vpcid
  public-subnet-ids = module.prod_network.all-public-subnets
  alb-sg-id         = module.prod_network.alb-sg-id
}

# AWS AutoScaling Module
module "autoscaling" {
  source                 = "./modules/autoscaling"
  private-app-subnet-ids = module.prod_network.all-private-app-subnets
  launch-template-id     = module.ec2.launch-temp-id
  alb-tg-arn             = module.alb.alb-tg-arn
}

# AWS RDS Module
module "rds" {
  source                = "./modules/rds"
  allocated_storage     = var.allocated_storage
  engine_type           = var.engine_type
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  private-db-subnet-ids = module.prod_network.all-private-db-subnets
  db-subnet-group-name  = var.db-subnet-group-name
  name                  = var.db_name
  rds-sg-id             = module.prod_network.rds-sg-id
}

