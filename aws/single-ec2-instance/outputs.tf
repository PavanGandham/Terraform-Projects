output "vpc_arn" {
  description = "VPC ARN......."  
  value = "${aws_vpc.default.arn}"
}
output "vpc_cidr" {
  description = "VPC CIDR Block......."  
  value = "${aws_vpc.default.cidr_block}"
}
output "vpc_id" {
  description = "VPC ID......."  
  value = "${aws_vpc.default.id}"
}
output "vpc_ownerid" {
  description = "VPC Owner ID.........."  
  value = "${aws_vpc.default.owner_id}"
}
output "s3_bucket_id" {
  description = "S3 Bucket Name ......."
  value = "${aws_s3_bucket.b1.*.arn}"
}



