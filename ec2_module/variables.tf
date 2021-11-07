variable "environment" {
  type    = string
  default = "Staging"
}

variable "default_tags" {}

variable "ecs_vpc_id" {
  type    = string
}

variable "sg_public_id" {
  type    = string
}

variable "public_sub_id" {}

variable "key_pair" {
  type    = string
  default = "devmaster"
}

// LOCALS


locals {
  instance_types = {
    Staging = {
      type = "t2.micro"
      ami  = "ami-0d5eff06f840b45e9"
    },
    Production = {
      type = "t3.micro"
      ami  = "ami-0d5eff06f840b45e9"
    }
  }
  instance = lookup(local.instance_types, var.environment)
}
