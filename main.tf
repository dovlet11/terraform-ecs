terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "shared_vars" {
  source = "./shared_vars"
}

module "vpc_module" {
  default_tags = module.shared_vars.default_tags
  source       = "./vpc_module"
}

module "sg_module" {
  depends_on   = [module.vpc_module]
  default_tags = module.shared_vars.default_tags
  ecs_vpc_id   = module.vpc_module.ecs_vpc_id
  environment  = module.shared_vars.env
  source       = "./sg_module"
}

module "ec2_module" {
  depends_on   = [module.sg_module]
  environment  = module.shared_vars.env
  default_tags = module.shared_vars.default_tags
  ecs_vpc_id   = module.vpc_module.ecs_vpc_id
  sg_public_id = module.sg_module.sg_public_id
  public_sub_id   = module.vpc_module.public_sub_id
  source       = "./ec2_module"
}
