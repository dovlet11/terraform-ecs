resource "aws_subnet" "private_sub" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.private_sub[count.index].cidr_block
  availability_zone = var.private_sub[count.index].az_name

  count = length(var.private_sub)

  tags = merge(var.default_tags, {
    "Name" = "ecs_private_sub_${count.index + 1}"
  })
}

resource "aws_subnet" "public_sub" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.public_sub[count.index].cidr_block
  availability_zone = var.public_sub[count.index].az_name
  map_public_ip_on_launch = "true"

  count = length(var.public_sub)

  tags = merge(var.default_tags, {
    "Name" = "ecs_public_sub_${count.index + 1}"
  })
}
