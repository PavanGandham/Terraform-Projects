output "db-instance-endpoint" {
  value = "${aws_db_instance.rds.endpoint}"
}
output "db-instance-id" {
  value = "${aws_db_instance.rds.id}"
}
output "db-engine" {
  value = "${aws_db_instance.rds.engine}"
}
output "engine-version" {
  value = "${aws_db_instance.rds.engine_version_actual}"
}
output "db-instance-class" {
  value = "${aws_db_instance.rds.instance_class}"
}
output "db-status" {
  value = "${aws_db_instance.rds.status}"
}
output "name" {
  value = "${aws_db_instance.rds.name}"
}
output "port" {
  value = "${aws_db_instance.rds.port}"
}
output "db-username" {
  value = "${aws_db_instance.rds.username}"
}







