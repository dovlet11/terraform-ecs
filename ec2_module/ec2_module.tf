resource "aws_instance" "web" {
  ami                    = local.instance.ami
  instance_type          = local.instance.type
  subnet_id              = var.public_sub_id[0]
  key_name               = var.key_pair
  vpc_security_group_ids = ["${var.sg_public_id}"]

  tags = merge(var.default_tags, {
    "Name" = "EC2_${var.environment}"
  })
}
