# resource "aws_s3_bucket" "b1" {
#     acl = "private"
#     tags = {
#         Name = "${var.bucketname}"
#         Environment = "${var.environment}"
#     }
#     depends_on = [
#         "${aws_route_table_association.public-route}",
#     ]
# }
