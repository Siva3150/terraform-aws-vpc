resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags, 
    {
      Name = local.name
    }
  )

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = local.name
    }

  )
  
}


resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = local.azs[count.index]
  tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
        Name = "${local.name}-public-${local.azs[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = local.azs[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnets_tags,
    {
        Name = "${local.name}-private-${local.azs[count.index]}"
    }
  )
}