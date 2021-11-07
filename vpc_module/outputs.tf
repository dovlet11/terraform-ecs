output ecs_vpc_id {
  value = aws_vpc.ecs_vpc.id
}

output public_sub_id {
  value = aws_subnet.public_sub.*.id
}