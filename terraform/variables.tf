variable "vpc_id" {
  type = list(string)
  default = [ "vpc-43b03f3e" ]
}
variable "project_name" {}
variable "launch_type" { default = "FARGATE" }
variable "rds_allocated_storage" {}
variable "rds_engine" {}
variable "rds_engine_version" {}
variable "rds_instance_class" {}
variable "rds_storage_type" { default = "standard" }
variable "db_name" {}
variable "database_user" {}
variable "database_password" {}
variable "docker_image_name" {}
variable "docker_image_revision" {}
