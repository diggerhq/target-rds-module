
resource "aws_db_subnet_group" "rds_private_subnet_group" {
  name_prefix = "rds_private_subnet_group"
  subnet_ids  = var.private_subnets

  tags = {
    Name = "${var.aws_app_identifier}-rds-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name_prefix = "${var.aws_app_identifier}-rds-sg"
  vpc_id      = var.vpc_id
  description = "RDS database ${var.aws_app_identifier}"

  # Only postgres in

  dynamic "ingress" {
    for_each = var.security_groups
    content {
      name            = volume.ingress.value
      from_port       = var.rds_port
      to_port         = var.rds_port
      protocol        = "tcp"
      security_groups = var.security_groups
    }
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "random_password" "rds_password" {
  length  = 32
  special = false
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.identifier
  db_name                = var.db_name
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.database_username
  port                   = var.rds_port
  password               = random_password.rds_password.result
  snapshot_identifier    = var.snapshot_identifier
  skip_final_snapshot    = true
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_private_subnet_group.name

  lifecycle {
    ignore_changes = [
      backup_retention_period,
      backup_window
    ]
  }
}

locals {
  database_address  = aws_db_instance.rds_instance.address
  database_password = random_password.rds_password.result
  database_port     = aws_db_instance.rds_instance.port
  database_url      = "${var.connection_schema}://${var.database_username}:${local.database_password}@${local.database_address}:${local.database_port}/${var.db_name}"
}

resource "aws_ssm_parameter" "database_password" {
  name  = "${var.aws_app_identifier}.app_rds.database_password"
  value = local.database_password
  type  = "SecureString"
}

resource "aws_ssm_parameter" "database_url" {
  name  = "${var.aws_app_identifier}.app_rds.database_url"
  value = local.database_url
  type  = "SecureString"
}
