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

# module "shared_vars" {
#   source = "./shared_vars"
# }

# module "ec2_module" {
#   instance_type = module.shared_vars.instance_type
#   instance_tag = module.shared_vars.env
#   source = "./ec2_module"
# }

module "vpc_module" {
  source = "./vpc_module"
}