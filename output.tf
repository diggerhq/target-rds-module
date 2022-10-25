
output "database_address" {
  value = aws_db_instance.digger_rds.address
}

output "database_endpoint" {
  value = aws_db_instance.digger_rds.endpoint
}

output "database_name" {
  value = var.database_name
}

output "database_username" {
  value = var.database_username
}

output "database_password_ssm_arn" {
  value = aws_ssm_parameter.database_password.arn
}

output "database_port" {
  value = aws_db_instance.digger_rds.port
}

output "database_url_ssm_arn" {
  value = aws_ssm_parameter.database_url.arn
}
