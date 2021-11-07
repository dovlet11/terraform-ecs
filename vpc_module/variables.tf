variable "default_tags" {}


// Subnet
variable "private_sub" {
  type = list(object({
    az_name    = string
    cidr_block = string
  }))
  default = [{
    az_name    = "us-east-1a"
    cidr_block = "10.0.1.0/24"
    },
    {
      az_name    = "us-east-1b"
      cidr_block = "10.0.2.0/24"
  }]
}

variable "public_sub" {
  type = list(object({
    az_name    = string
    cidr_block = string
  }))
  default = [{
    az_name    = "us-east-1c"
    cidr_block = "10.0.3.0/24"
    },
    {
      az_name    = "us-east-1d"
      cidr_block = "10.0.4.0/24"
  }]
}