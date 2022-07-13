locals {
  bucket_name = "pavan-s3-tf-test-site"
  aws_region = "us-east-1"
}

module "s3_site" {
    source = "./s3_site"
    bucket_name = local.bucket_name
}
module "cloudfront" {
    source = "./cloudfront"
    website_endpoint = module.s3_site.website_endpoint
    bucket_name = local.bucket_name
    regional_domain_name = module.s3_site.regional_domain_name
}
