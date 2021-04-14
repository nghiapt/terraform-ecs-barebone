resource "aws_ecs_cluster" "main" {
  name = "main"
  capacity_providers = ["FARGATE"]
  tags = {
      project = "insurance"
  }
}