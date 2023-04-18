resource "aws_alb" "app_alb" {
  name            = "${var.project_name}-alb"
  subnets         = data.aws_subnets.app_subnet.ids
  security_groups = data.aws_security_groups.app_sg.ids
}
resource "aws_alb_target_group" "app_alb_tg" {
  name        = "${var.project_name}-alb-tg"
  port        = 8000
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.app_vpc.id
  target_type = "ip"
  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }
}
resource "aws_alb_listener" "app_alb_listener" {
  load_balancer_arn = aws_alb.app_alb.id
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.app_alb_tg.id
    type             = "forward"
  }
}
