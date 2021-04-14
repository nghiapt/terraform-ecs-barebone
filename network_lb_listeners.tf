resource "aws_lb_listener" "ecs_main" {
  load_balancer_arn = aws_lb.ecs_main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service_a.arn
  }
}