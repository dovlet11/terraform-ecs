# variable "myinstance" {
#   type = map
#   default = {
#     type = "t2.micro"
#     ami  = "ami-0d5eff06f840b45e9"
#   }
# }

variable "instance_type" {}

variable "instance_tag" {}

resource "aws_instance" "web" {
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = var.instance_type
  availability_zone = "us-east-1a"
  key_name          = "devmaster"

  tags = {
    Name = "EC2_${var.instance_tag}"
  }
}
