output "app_dns_lb" {
  description = "DNS load balancer"
  value       = aws_alb.app_alb.dns_name
}
