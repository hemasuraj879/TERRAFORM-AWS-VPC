resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-vpc${var.env}"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_cidr)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.availability_zone[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-public-${var.availability_zone[count.index]}"
    }
  )
}