resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "${var.env}-vpc"
  }
}
