resource "aws_vpc" "ecs_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = merge(var.default_tags, {
    "Name" = "ECS VPC"
  })
}


resource "aws_internet_gateway" "ecs_vpc_igw" {
  vpc_id = aws_vpc.ecs_vpc.id

  depends_on = [
    aws_vpc.ecs_vpc
  ]

  tags = merge(var.default_tags, {
    "Name" = "ECS IGW"
  })
}