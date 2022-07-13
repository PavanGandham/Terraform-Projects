# Provider configuration
aws_account       = "<PROVIDED BY DEV-OPS engineer>"
aws_region        = "<PROVIDED BY DEV-OPS engineer>"

# App images
api_image_url = "<PROVIDED BY DEV-OPS engineer>"
app_image_url = "<PROVIDED BY DEV-OPS engineer>"

# ECS/ALB networking
vpc_lookup_tags = {}
fargate_subnet_lookup_tags = {}
alb_subnet_lookup_tags = {}
fargate_assign_public_ip = "<PROVIDED BY DEV-OPS engineer>" # true | false

# API config

s3_buckets = ["<BUCKET-NAME>"]
dynamodb_tables = ["<TABLE-NAME>"]

