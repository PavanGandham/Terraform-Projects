# Create a RDS Instance

resource "aws_db_subnet_group" "db-subnet-group" {
  name = "${var.db-subnet-group-name}"
  subnet_ids = ["${var.private-db-subnet-ids[0]}","${var.private-db-subnet-ids[1]}"]
  tags = {
      Name = "My DB Subnet group"
  }
}

resource "aws_db_instance" "rds" {
  db_subnet_group_name = "${aws_db_subnet_group.db-subnet-group.id}"
  allocated_storage = "${var.allocated_storage}"
  engine = "${var.engine_type}"
  engine_version = "${var.engine_version}"
  instance_class = "${var.instance_class}"
  multi_az = true
  name = "${var.name}"
  username = "${var.db-username}"
  password = "${var.db-password}"
  skip_final_snapshot = true
  vpc_security_group_ids = ["${var.rds-sg-id}"]
}
