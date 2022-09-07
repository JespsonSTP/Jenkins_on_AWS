resource "aws_vpc" "datacentre-VPC" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    "Name" = "datacentre-VPC"
  }
}

#setting up the internet gateway
resource "aws_internet_gateway" "datacentre-VPC_IGW" {
  vpc_id = aws_vpc.datacentre-VPC.id

  tags = {
    "Name" = "datacentre-VPC_IGW"
  }
}

# Elastic IP for Nat Gateway
resource "aws_eip" "datacentre-VPC_nat_elastic_ip1" {
  vpc = true
  tags = {
    "Name" = "datacentre-VPC_Elastic_IP1"
  }
}

# Elastic IP for Nat Gateway
resource "aws_eip" "datacentre-VPC_nat_elastic_ip2" {
  vpc = true
  tags = {
    "Name" = "datacentre-VPC_Elastic_IP2"
  }
}
