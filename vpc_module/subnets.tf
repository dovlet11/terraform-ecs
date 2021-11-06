variable "private_sub" {
  type = list(object({
    az_name    = string
    cidr_block = string
  }))
  default = [{
    az_name    = "us-east-1a"
    cidr_block = "10.0.1.0/24"
    },
    {
      az_name    = "us-east-1b"
      cidr_block = "10.0.2.0/24"
  }]
}

variable "public_sub" {
  type = list(object({
    az_name    = string
    cidr_block = string
  }))
  default = [{
    az_name    = "us-east-1c"
    cidr_block = "10.0.3.0/24"
    },
    {
      az_name    = "us-east-1d"
      cidr_block = "10.0.4.0/24"
  }]
}

resource "aws_subnet" "private_sub" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.private_sub[count.index].cidr_block
  availability_zone = var.private_sub[count.index].az_name

  count = length(var.private_sub)

  tags = merge(module.shared_vars.default_tags, {
    "Name" = "ecs_private_sub_${count.index + 1}"
  })
}

resource "aws_subnet" "public_sub" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.public_sub[count.index].cidr_block
  availability_zone = var.public_sub[count.index].az_name

  count = length(var.public_sub)

  tags = merge(module.shared_vars.default_tags, {
    "Name" = "ecs_public_sub_${count.index + 1}"
  })
}
