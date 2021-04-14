resource "aws_lb" "ecs_main" {
  name               = "ecs-main"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.main.ids

  tags = {
    project = "insurance"
    service = "service-a"
  }
}