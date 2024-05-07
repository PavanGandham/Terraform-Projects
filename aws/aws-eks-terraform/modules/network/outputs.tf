output "vpc-subnet-ids" {
    value = aws_subnet.public-subnets.*.id
}
