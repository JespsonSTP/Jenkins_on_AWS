#Create NAT Gateway
resource "aws_nat_gateway" "NAT1a" {
  allocation_id = aws_eip.datacentre-VPC_nat_elastic_ip1.id
  subnet_id     = aws_subnet.datacentre-VPC_privsubnet1a.id
  depends_on    = [aws_subnet.datacentre-VPC_privsubnet1a]

  tags = {
    "Name" = "NAT Gateway_datacentre-VPC1a"
  }
}

resource "aws_nat_gateway" "NAT1b" {
  allocation_id = aws_eip.datacentre-VPC_nat_elastic_ip2.id
  subnet_id     = aws_subnet.datacentre-VPC_privsubnet1b.id
  depends_on    = [aws_subnet.datacentre-VPC_privsubnet1b]

  tags = {
    "Name" = "NAT Gateway_datacentre-VPC1b"
  }
}

