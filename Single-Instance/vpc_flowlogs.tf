# resource "aws_flow_log" "testvpcflowlogs" {
# log_destination = aws_s3_bucket.flowlogs-bucket.arn
# log_destination_type = "s3"
# traffic_type = "ALL"
# vpc_id = aws_vpc.default.id
# }

# resource "aws_s3_bucket" "flowlogs-bucket" {
# bucket = "devopsb17-vpcflowlogs3"
# }