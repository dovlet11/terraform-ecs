module "shared_vars" {
  source = "./shared_vars"
}

resource "aws_vpc" "moz_ecs_project" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = module.shared_vars.default_tags
}