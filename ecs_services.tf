resource "aws_ecs_service" service_a {
  name = "service-a"
  cluster = aws_ecs_cluster.main.id
  desired_count = 2
  launch_type = "FARGATE"
  task_definition = aws_ecs_task_definition.service_a.arn

  load_balancer {
    target_group_arn = aws_lb_target_group.service_a.arn
    container_name = "service-a"
    container_port = 8080
  }

  network_configuration {
    subnets = data.aws_subnet_ids.main.ids
    security_groups = [ data.aws_security_group.default.id ]
    assign_public_ip = true
  }


  lifecycle {
    ignore_changes = [ desired_count ]
  
  }

  depends_on = [ aws_lb.ecs_main ]

  tags = {
      project = "insurance"
      service = "service-a"
  }
}