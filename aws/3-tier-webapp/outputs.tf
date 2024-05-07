output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds.db-instance-endpoint
}
output "lb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.alb-dns-name
}

