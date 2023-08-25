
output "database_address" {
  value = aws_db_instance.rds_instance.address
}

output "database_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}

output "db_name" {
  value = aws_db_instance.rds_instance.db_name
}

output "database_username" {
  value = var.database_username
}

output "database_port" {
  value = aws_db_instance.rds_instance.port
}

output "database_connection_string_ssm_arn" {
  value = aws_ssm_parameter.database_connection_string.arn
}
