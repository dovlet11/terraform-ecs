resource "aws_security_group" "public" {
  name        = "ecs_sg_${var.environment}"
  description = "Allowed inbound traffic"
  vpc_id      = var.ecs_vpc_id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    "Name" = "ECS_sg_${var.environment}"
  })
}
