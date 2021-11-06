resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ecs_vpc.id

  route = []

  tags = merge(module.shared_vars.default_tags, {
    "Name" = "ECS public-rt"
  })
}
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ecs_vpc_igw.id
  depends_on             = [aws_route_table.public]
}

resource "aws_route_table_association" "public" {
  count = length(var.public_sub)

  subnet_id      = element(aws_subnet.public_sub.*.id, count.index)
  route_table_id = aws_route_table.public.id

  depends_on = [aws_subnet.public_sub]
}
