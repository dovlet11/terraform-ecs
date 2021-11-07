variable "environment" {
  type    = string
  default = "Staging"
}

variable "default_tags" {}

variable "ecs_vpc_id" {
  type    = string
}

locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress TLS rules for port 443"
   },
   {
      port        = 80
      description = "Ingree HTTP rules for port 80"
   },
   {
      port        = 22
      description = "Ingree SSH rules for port 22"
   }]
}
