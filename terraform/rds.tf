resource "aws_db_instance" "app_rds" {
  identifier                = "${var.project_name}-rds"
  allocated_storage         = var.rds_allocated_storage
  engine                    = var.rds_engine
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance_class
  db_name                   = var.db_name
  username                  = var.database_user
  password                  = var.database_password
  vpc_security_group_ids    = data.aws_security_groups.app_sg.ids
  storage_type              = var.rds_storage_type
  skip_final_snapshot       = true
}


# # IAM roles
resource "aws_iam_role" "app_execution_role" {
  name               = "${var.project_name}-execution-role"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "ecs.amazonaws.com",
          "ecs-tasks.amazonaws.com"
        ]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}
