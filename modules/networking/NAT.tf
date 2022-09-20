#Create NAT Gateway
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.datacentre-VPC_nat_elastic_ip.id
  subnet_id     = aws_subnet.datacentre-VPC_pubsubnet[0].id 

  tags = {
    "Name" = "NAT Gateway_datacentre-VPC"
  }
}

