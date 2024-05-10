provider "aws" {
  region = "us-west-2"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = var.existing_vpc_id
  cidr_block = cidrsubnet(var.subnet_cidr, 4, count.index)
  count = length(var.availability_zones)

  availability_zone = var.availability_zones[count.index]
}
