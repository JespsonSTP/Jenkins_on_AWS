#creating the subnet
resource "aws_subnet" "datacentre-VPC_pubsubnet1a" {
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.subnet_cidr[0]
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_pubsubnet1a"
  }
}

resource "aws_subnet" "datacentre-VPC_pubsubnet1b" {
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.subnet_cidr[1]
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_pubsubnet1b"
  }
}
resource "aws_subnet" "datacentre-VPC_privsubnet1a" {
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.subnet_cidr[2]
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_privsubnet1a"
  }
}
resource "aws_subnet" "datacentre-VPC_privsubnet1b" {
  vpc_id = aws_vpc.datacentre-VPC.id
  cidr_block = var.subnet_cidr[3]
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = false 
  depends_on              = [aws_vpc.datacentre-VPC]
  tags = {
    "Name" = "datacentre-VPC_privsubnet1b"
  }
}
