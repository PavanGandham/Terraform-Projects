resource "aws_eip" "eips" {
  count = "${length(var.public_subnets)}"
  depends_on = [aws_internet_gateway.webapp_igw]
  tags = {
    Name = "EIP-${count.index}"
    environment = "${var.environment}"
  }
}
