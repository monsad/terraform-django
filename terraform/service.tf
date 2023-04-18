resource "aws_ecs_service" "app_service" {
  name        = "${var.project_name}-service"
  cluster     = aws_ecs_cluster.app_cluster.arn
  launch_type = var.launch_type

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 0
  desired_count                      = 2
  task_definition                    = aws_ecs_task_definition.django_app.arn

  network_configuration {
    assign_public_ip = true
    security_groups  = data.aws_security_groups.app_sg.ids
    subnets          = data.aws_subnets.app_subnet.ids
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app_alb_tg.id
    container_name   = var.project_name
    container_port   = 8000
  }
}
