variable "aws_app_identifier" {}

variable "allocated_storage" {
  type        = number
  default     = 100
  description = "The default storage for the RDS instance"
}

variable "storage_type" {
  default = "gp2"
}

variable "identifier" {}

variable "engine" {
  default = "postgres"
}

variable "rds_port" {
  default = 5432
}

variable "connection_schema" {
  default = "postgres"
}

variable "engine_version" {
  default = "12"
}

variable "instance_class" {
  default = "db.t3.micro"
}

variable "db_name" {
  default = "digger"
}

variable "database_username" {
  default = "digger"
}

variable "publicly_accessible" {
  default = false
}

variable "snapshot_identifier" {
  default = ""
}

variable "vpc_id" {}

variable "subnets" {}

variable "security_groups" {}

variable "tags" {}
