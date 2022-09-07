# instance and ami
data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "Jenkins-server1a" {
  ami                         = data.aws_ami.amazon-linux-2
  instance_type               = var.linux_instance_type
  subnet_id                   = module.networking.subnet.datacentre-VPC_privsubnet1a.id
  vpc_security_group_ids      = [aws_security_group.urlshorQR_app-VPC_jenkinSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  
  # root disk
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = false
  }
 
  tags = {
    Name   = "jenkins_master1a"
  }
}

resource "aws_instance" "Jenkins-server1b" {
  ami                         = data.aws_ami.amazon-linux-2
  instance_type               = var.linux_instance_type
  subnet_id                   = module.networking.subnet.datacentre-VPC_privsubnet1a.id
  vpc_security_group_ids      = [aws_security_group.urlshorQR_app-VPC_jenkinSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  
  # root disk
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = false
  }
 
  tags = {
    Name   = "jenkins_master1b"
  }
}

resource "aws_instance" "AnsibleController" {
  ami                         = data.aws_ami.amazon-linux-2
  instance_type               = var.instance_type
  subnet_id                   = module.networking.subnet.datacentre-VPC_privsubnet1a.id
  vpc_security_group_ids      = [aws_security_group.urlshorQR_app-VPC_jenkinSG.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("./Install-Jenkins.sh")
  
  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = false
    encrypted             = true
  }

  tags = {
    "Name" = "Ansible-Controller"
  }
}
