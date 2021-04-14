resource "aws_lb_target_group" "service_a" {
  name        = "service-a"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    project = "insurance"
    service = "service-a"
  }
}