provider "aws" {
  region = "us-west-2"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = var.existing_vpc_id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, count.index)
  count = length(var.availability_zones)

variable "availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"] 
}
