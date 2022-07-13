region               = "us-east-1"
azs                  = ["us-east-1a", "us-east-1b"]
vpc_cidr             = "10.50.0.0/16"
vpc_name             = "3-Tier-Prod-VPC"
public_subnets       = ["10.50.1.0/24", "10.50.2.0/24"]
private_app_subnets  = ["10.50.10.0/24", "10.50.20.0/24"]
private_db_subnets   = ["10.50.30.0/24", "10.50.40.0/24"]
igw_name             = "Prod-IGW"
public_route_table   = "3-Tier-Public-RT"
private_route_table  = "3-Tier-Private-RT"
environment          = "Prod"
sg_name              = "SG-For"
instance_type        = "t2.micro"
ami_id               = "ami-0c02fb55956c7d316"
key_name             = "key-2"
allocated_storage    = 10
engine_type          = "mysql"
engine_version       = "5.7.31"
instance_class       = "db.t2.micro"
alb-name             = "Web-alb"
db-subnet-group-name = "rds-subnet-group"
db_name              = "webappdb"
owner-id             = "625220728704"