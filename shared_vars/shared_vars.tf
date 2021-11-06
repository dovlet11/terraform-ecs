// LOCALS
locals {
  env = terraform.workspace

  env_suffix_env = {
    default = "Staging"
    staging = "Staging"
    prod    = "Production"
  }

  env_suffix = lookup(local.env_suffix_env, local.env, "default")

  instance_types = {
    Staging    = "t3.micro"
    Production = "t2.micro"
  }
}


// OUTPUTS

output "env" {
  value = local.env_suffix
}

output "instance_type" {
  value = lookup(local.instance_types, local.env_suffix)
}

output "default_tags" {
  value = {
    Name        = "Terraform"
    Project     = "MOZ ECS Project"
    Environment = local.env_suffix
  }
}