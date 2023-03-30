# NETWORKING #
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  #name = "my-vpc"
  cidr = var.network_cid_vpc[terraform.workspace]

  azs            = slice(data.aws_availability_zones.available.names, 0, (var.vpc_subnet_count[terraform.workspace]))
  public_subnets = [for subnet in range(var.vpc_subnet_count[terraform.workspace]) : cidrsubnet(var.network_cid_vpc[terraform.workspace], 8, subnet)]

  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  map_public_ip_on_launch = true
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-${var.vpcnamebalancer}"
  })
}
/*
resource "aws_vpc" "vpc" {
  cidr_block           = var.network_cid_vpc
  enable_dns_hostnames = true
  map_public_ip_on_launch = true
  #tags                 = local.common_tags
  tags = merge(local.common_tags, {
    Name = var.vpcnamebalancer
  })
}

resource "aws_internet_gateway" "igw" {
  tags   = local.common_tags
  vpc_id = aws_vpc.vpc.id
}

#SUBNETWORKS
resource "aws_subnet" "subnets" {
  count = var.vpc_subnet_count
  #cidr_block              = var.network_cids[count.index]
  cidr_block              = cidrsubnet(var.network_cid_vpc, 8, count.index)
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-subnet-${count.index}"
  })
}*/