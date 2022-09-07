output "vpc" {
  value = aws_vpc.datacentre-VPC                                     
}
 
output "subnet" {
  value = {                                               
    datacentre-VPC_pubsubnet1a          = aws_subnet.datacentre-VPC_pubsubnet1a           
    datacentre-VPC_pubsubnet1b          = aws_subnet.datacentre-VPC_pubsubnet1b                            
    datacentre-VPC_privsubnet1a         = aws_subnet.datacentre-VPC_privsubnet1a      
    datacentre-VPC_privsubnet1b         = aws_subnet.datacentre-VPC_privsubnet1b      
  }                                                    
}
output "security_groups" {
  value = {                                               
    bastion_sg     = aws_security_group.bastion_host_sg           
    jenkins_sg     = aws_security_group.jenkins_master_sg                              
    elb_sg         = aws_security_group.elb_jenkins_sg      
  }                                                    
}