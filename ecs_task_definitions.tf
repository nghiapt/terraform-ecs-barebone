 resource "aws_ecs_task_definition" "service_a" {
    family = "service-a"
    container_definitions = file("ecs_container_definitions/service_a.json")
    cpu = 256
    memory = 512
    requires_compatibilities = [ "FARGATE" ]
    execution_role_arn = "arn:aws:iam::356705062463:role/ecsTaskExecutionRole"
    network_mode = "awsvpc"

    tags = {
      project = "insurance"
      service = "service-a"
    }
}