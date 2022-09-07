resource "aws_route_table" "public_rt1" {
  vpc_id = aws_vpc.datacentre-VPC.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.datacentre-VPC_IGW.id
  }
 
  tags = {
    Name   = "public_rt_datacentre-VPC"
  }
}

resource "aws_route_table" "private_rt1a" {
  vpc_id = aws_vpc.datacentre-VPC.id
 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT1a.id
  }
  tags = {
    Name   = "private_rt1a_datacentre"
  }
}

resource "aws_route_table" "private_rt1b" {
  vpc_id = aws_vpc.datacentre-VPC.id
 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT1b.id
  }
  tags = {
    Name   = "private_rt1b_datacentre"
  }
}

resource "aws_route_table_association" "publicroute1" {
  subnet_id = aws_subnet.datacentre-VPC_pubsubnet1a.id
  route_table_id = aws_route_table.public_rt1.id
  depends_on     = [aws_route_table.public_rt1]
}

resource "aws_route_table_association" "publicroute2" {
  subnet_id      = aws_subnet.datacentre-VPC_pubsubnet1b.id
  route_table_id = aws_route_table.public_rt1.id
  depends_on     = [aws_route_table.public_rt1]
}

resource "aws_route_table_association" "privateroute1" {
  subnet_id      = aws_subnet.datacentre-VPC_privsubnet1a.id
  route_table_id = aws_route_table.private_rt1a.id
  depends_on     = [aws_route_table.private_rt1a]
}

resource "aws_route_table_association" "privateroute2" {
  subnet_id      = aws_subnet.datacentre-VPC_privsubnet1b.id
  route_table_id = aws_route_table.private_rt1b.id
  depends_on     = [aws_route_table.private_rt1b]
}

